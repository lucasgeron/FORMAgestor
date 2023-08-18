class App::NegotiationsController < ApplicationController
  before_action :set_app_negotiation, only: %i[ show edit update  ]
  before_action :set_content_for_form, only: %i[ edit update]
  before_action :set_contant_for_sidebar, only: %i[ index search ]
  before_action :set_calendars, only: %i[ index search ]

  # GET /app/negotiations or /app/negotiations.json
  def index

    if current_access_is_user? && get_current_access.vendor && get_current_access.vendor.cities.any?
      # recupera a lista de negociações baseada no vendedor atual -- incluí apenas negociações.
      collection = App::Negotiation.by_client(get_client_id).by_vendor(get_current_access.vendor).includes( :status, :vendor, :calendar, {course: :institution}).where('app_calendars.active = true').order('app_courses.name')
      
      # recupera a lista de cidades que contenham negociações de acordo com a coleção de negociações acima.
      @app_cities = App::City.by_client(get_client_id).by_negotiation(collection.ids).order(:name).distinct
      
      # recupera a lista de instituições que contenham negociações de acordo com a coleção de negociações acima.
      @app_institutions = App::Institution.by_client(get_client_id).by_negotiation(collection.ids).order(:abreviation).includes(:image_attachment).distinct

    else
      collection = App::Negotiation.none
      @app_institutions = App::Institution.none
      @app_calendars = App::Calendar.none
    end
    @pagy, @app_negotiations = set_pagy(collection)
    set_counters(@app_negotiations)

  end

  # GET /app/negotiations/1 or /app/negotiations/1.json
  def show
  end

  # GET /app/negotiations/1/edit
  def edit
  end

  # PATCH/PUT /app/negotiations/1 or /app/negotiations/1.json
  def update
    if @app_negotiation.update(app_negotiation_params)
      if params[:app_negotiation][:active] == 'false'
        flash[:success] = t('views.app.negotiations.flash.hide', model: App::Negotiation.model_name.human)
      elsif params[:app_negotiation][:active] == 'true'
        flash[:success] = t('views.app.negotiations.flash.unhide', model: App::Negotiation.model_name.human)
      else
      flash[:success] = t('views.app.general.flash.update_f', model: App::Negotiation.model_name.human)
      end
      redirect_to app_negotiation_url(@app_negotiation)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # GET /app/negotiations/filter?course=ID&target=DIV_ID
  def filter
    @negotiations = App::Negotiation.by_client(get_client_id).by_course(params[:course])
    @target = params[:target]


    respond_to do |format|
      format.turbo_stream
    end
  end

  # GET /app/negotiations/search
  def search

    collection = App::Negotiation.by_client(get_client_id).includes(:course, :status, :vendor).joins(:calendar).where('app_calendars.active = true').order('app_courses.name')


    if %i[query status_ids vendor_ids company_ids].any? { |key| params[key].present? }
      collection = collection.search(params[:query]) if params[:query].present?
      collection = collection.by_status_negotiation(params[:status_ids]) if params[:status_ids].present? 
      collection = collection.by_vendor(params[:vendor_ids]) if params[:vendor_ids].present?
      collection = collection.by_company(params[:company_ids]) if params[:company_ids].present?
    else
      return redirect_to app_negotiations_path
    end
    
    # recupera a lista de cidades que contenham negociações de acordo com a coleção de negociações acima.
    @app_cities = App::City.by_client(get_client_id).by_negotiation(collection.ids).order(:name).distinct
    
    # recupera a lista de instituições que contenham negociações de acordo com a coleção de negociações acima.
    @app_institutions = App::Institution.by_client(get_client_id).by_negotiation(collection.ids).order(:abreviation).distinct

    @pagy, @app_negotiations = set_pagy(collection)
    # abort params.inspect
    set_counters(@app_negotiations)
    render :index

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_negotiation
      @app_negotiation = App::Negotiation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_negotiation_params
      params.require(:app_negotiation).permit(:calendar_id, :course_id, :vendor_id, :company_id, :status_id, :reference, :active)
    end

    def set_contant_for_sidebar
      null_status = OpenStruct.new(id: -1, name: t('activerecord.blank_entries.status_negotiation'))
      null_vendor = OpenStruct.new(id: -1, name: t('activerecord.blank_entries.vendor'))
      null_company = OpenStruct.new(id: -1, name: t('activerecord.blank_entries.company'))

      @status = [null_status] + App::StatusNegotiation.by_client(get_client_id).order(:name)
      @vendors = [null_vendor] + App::Vendor.by_client(get_client_id).order(:name).distinct
      @companies = [null_company] + App::Company.by_client(get_client_id).order(:name)
    end

    

    def set_calendars
      @app_calendars = App::Calendar.by_client(get_client_id).by_calendar_status('active').order(year: :desc, semester: :desc)
    end

    def set_counters(app_negotiations)

      @counters = []
      status_ids =  params[:status_ids].present? ? params[:status_ids] : app_negotiations.pluck(:status_id).uniq.to_a
      
      if status_ids.include?(nil) || status_ids.include?('-1')
        status_not_assigned = App::StatusNegotiation.new(name: t('activerecord.blank_entries.status_negotiation'), style:'fa-regular', icon:'circle')
        @counters << [status_not_assigned, app_negotiations.where(status: nil).count]
      end

      status_ids.reject.reject { |status| status == '-1' || status.nil? }.each do |status_id|
        @counters << [App::StatusNegotiation.find(status_id), app_negotiations.where(status_id: status_id).count]
      end
      
    end

    def set_content_for_form
      @vendors = App::Vendor.by_client(get_client_id).order(:name)
      @status = App::StatusNegotiation.by_client(get_client_id).order(:name)
      @companies = App::Company.by_client(get_client_id).order(:name)
    end
end
