class App::CoursesController < ApplicationController
  before_action :authenticate_user_or_admin! 
  before_action :check_client_id, only: %i[ show edit update destroy]
  before_action :set_app_course, only: %i[ show edit update destroy ]
  before_action :set_content_for_sidebar, only: %i[ index search ]
  before_action :set_content_for_form, only: %i[ edit update new create ]


  # GET /app/courses or /app/courses.json
  def index
    if current_access_is_user? && get_current_access.vendor && get_current_access.vendor.cities.any?
      @app_cities = get_current_access.vendor.cities.order(:name)
      @city_ids = @app_cities.ids # for sidebar
      @app_institutions = App::Institution.by_client(get_client_id).by_city(@app_cities)
      collection = App::Course.by_client(get_client_id).by_institution(@app_institutions).order(:name)
    else
      collection = App::Course.none
      @app_cities = App::City.none
    end
    @pagy, @app_courses = set_pagy(collection)
    
  end

  # GET /app/courses/1 or /app/courses/1.json
  def show
    @negotiations = @app_course.negotiations if @app_course.negotiations.any?
  end

  # GET /app/courses/new
  def new
    @app_course = App::Course.new(institution_id: params[:institution_id])
  end

  # GET /app/courses/1/edit
  def edit
  end

  # POST /app/courses or /app/courses.json
  def create
    @app_course = App::Course.new(app_course_params)
    set_client_id(@app_course)
    
    if @app_course.save

      NegotiationGeneratorJob.perform_later(:for_course, @app_course) # call the job to create the negotiation for this course

      flash[:success] = t('views.app.general.flash.create_m', model: App::Course.model_name.human)
      redirect_to app_course_url(@app_course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /app/courses/1 or /app/courses/1.json
  def update
    if @app_course.update(app_course_params)
      flash[:success] = t('views.app.general.flash.update_m', model: App::Course.model_name.human)
      redirect_to app_course_url(@app_course)
    else
      render :edit, status: :unprocessable_entity
    end

  end

  # DELETE /app/courses/1 or /app/courses/1.json
  def destroy
    if @app_course.has_dependency?
      flash[:error] = t('views.app.general.flash.destroy_failed_m', model: App::Course.model_name.human)
      redirect_to @app_course
    else
      @app_course.destroy
      flash[:success] = t('views.app.general.flash.destroy_m', model: App::Course.model_name.human)
      redirect_to app_courses_url
    end

  end

  # GET /app/courses/filter?institution=ID&target=DIV_ID
  def filter
    @courses = App::Course.by_client(get_client_id).by_institution(params[:institution]).order(:name)
    @target = params[:target]

    respond_to do |format|
      format.turbo_stream
    end
  end
  
    #  GET /app/courses/search?query=:query&city_ids=:city_ids
  def search 

    collection = App::Course.by_client(get_client_id).order(:name)

    if %i[query city_ids].any? { |key| params[key].present? }
      collection = collection.by_city(params[:city_ids]) if params[:city_ids].present?
      collection = collection.search(params[:query]) if params[:query].present?  
    else
      return redirect_to app_courses_path 
    end
    
    @pagy, @app_courses = set_pagy(collection)
    @app_cities = App::City.by_client(get_client_id).by_course(collection.ids).distinct.order(:name)

    render :index

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_course
      @app_course = App::Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_course_params
      params.require(:app_course).permit(:name, :duration, :institution_id)
    end

      
  def set_content_for_sidebar
    @cities = App::City.by_client(get_client_id).joins(:institutions).distinct.order(:name)
  end

  def set_content_for_form
    @institutions = App::Institution.by_client(get_client_id).order(:abreviation)
  end

end
