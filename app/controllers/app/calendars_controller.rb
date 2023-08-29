class App::CalendarsController < ApplicationController
  
  
  before_action :authenticate_user_or_admin! 
  before_action :check_client_id, only: %i[ show edit update destroy]
  before_action :set_content_for_form, only: %i[ new edit create update ]
  before_action :set_app_calendar, only: %i[ show edit update destroy ]

  # GET /app/calendars or /app/calendars.json
  def index
    collection = App::Calendar.by_client(get_client_id).order(:year)
    @pagy,  @app_calendars = set_pagy(collection)
  end

  # GET /app/calendars/1 or /app/calendars/1.json
  def show
  end

  # GET /app/calendars/new
  def new
    @app_calendar = App::Calendar.new(active: true)
  end

  # GET /app/calendars/1/edit
  def edit
  end

  # POST /app/calendars or /app/calendars.json
  def create
    @app_calendar = App::Calendar.new(app_calendar_params)
    set_client_id(@app_calendar)

    if @app_calendar.save
      NegotiationGeneratorJob.perform_later(:for_calendar, @app_calendar) # call the job to create the negotiation for this course

      flash[:success] = t('views.app.general.flash.create_m', model: App::Calendar.model_name.human)
      redirect_to app_calendar_url(@app_calendar)
    else
        render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /app/calendars/1 or /app/calendars/1.json
  def update
    if @app_calendar.update(app_calendar_params)
      flash[:success] = t('views.app.general.flash.update_m', model: App::Calendar.model_name.human)
      redirect_to app_calendar_url(@app_calendar)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /app/calendars/1 or /app/calendars/1.json
  def destroy
    if @app_calendar.has_dependency?
      flash[:error] = t('views.app.general.flash.destroy_failed_m', model: App::Calendar.model_name.human)
      redirect_to @app_calendar
    else
    @app_calendar.destroy
      flash[:success] = t('views.app.general.flash.destroy_m', model: App::Calendar.model_name.human)
      redirect_to app_calendars_url
    end
  end


   #  GET /app/calendars/search?query=:query&status=:status
   def search 

    collection = App::Calendar.by_client(get_client_id)

    collection = collection.by_calendar_status(params[:status])
    collection = collection.search(params[:query].to_s) if params[:query].present?

    @pagy,  @app_calendars = set_pagy(collection)
    
    render :index

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_calendar
      @app_calendar = App::Calendar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_calendar_params
      params.require(:app_calendar).permit(:year, :semester, :active, :client_id)
    end

    def set_content_for_form
      @years = (Date.today.year...Date.today.year + 10).to_a
      @semesters = [1,2]
    end
end
