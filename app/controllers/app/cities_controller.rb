
class App::CitiesController < ApplicationController
  
  before_action :authenticate_user_or_admin! 
  before_action :check_client_id, only: %i[ show edit update destroy]
  before_action :set_app_city, only: %i[ show edit update destroy ]
  before_action :set_content_for_sidebar, only: %i[ index search ]
  
  # GET /app/cities or /app/cities.json
  def index

    @pagy,  @app_cities = pagy(App::City.by_client(get_client_id).order(:name), items: 4)
    @collection_src_url = 'app_cities_url'

    respond_to do |format|
      format.html  
      format.turbo_stream 
    end

  end

  # GET /app/cities/1 or /app/cities/1.json
  def show
  end

  # GET /app/cities/new
  def new
    @app_city = App::City.new
  end

  # GET /app/cities/1/edit
  def edit
  end

  # POST /app/cities or /app/cities.json
  def create

    @app_city = App::City.new(app_city_params)
    set_client_id(@app_city)

      if @app_city.save
         flash[:success] = t('views.app.general.flash.create', model: App::City.model_name.human)
         redirect_to app_city_url(@app_city)
      else
         render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /app/cities/1 or /app/cities/1.json
  def update
    if @app_city.update(app_city_params)
      flash[:success] = t('views.app.general.flash.update', model: App::City.model_name.human)
      redirect_to app_city_url(@app_city)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /app/cities/1 or /app/cities/1.json
  def destroy
    @app_city.destroy
    flash[:success] = t('views.app.general.flash.destroy', model: App::City.model_name.human)
    redirect_to app_cities_url
  end

  # GET /app/cities/filter?state=UF&target=DIV_ID
  def filter
    @cities = ConectaAddressBr::Cities.by_state_single(params[:state])
    @target = params[:target]
  
    respond_to do |format|
      format.turbo_stream
    end

  end

  #  GET /app/cities/search?query=:query&uf=:status
  def search 

    collection = App::City.by_client(get_client_id)
    collection = collection.search(params[:query])
    collection = collection.by_uf(params[:uf]) if params[:uf].present?

    @pagy,  @app_cities = pagy(collection.order(:name), items: 4)
    @collection_src_url = 'search_app_cities_path'
    
    respond_to do |format|
      format.html do
        render  "app/cities/index"
      end
      format.turbo_stream do
        render  "app/cities/index",
                locals: { collection: @app_cities, collection_name: "cities"}
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_city
      @app_city = App::City.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_city_params
      params.require(:app_city).permit(:name, :state)
    end

    def set_content_for_sidebar
      @states = App::City.by_client(get_client_id).pluck(:state).uniq.sort
    end
end
