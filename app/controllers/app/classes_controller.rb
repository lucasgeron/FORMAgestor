class App::ClassesController < ApplicationController

    before_action :set_institution, only: %i[ search ]
    before_action :set_negotiations, only: %i[ search ]
    before_action :set_contant_for_sidebar, only: %i[ index search ]
    before_action :set_calendars, only: %i[ index search ]

  # GET /app/negotiations or /app/negotiations.json
  def index
  end

  # GET /app/negotiations/search
  def search
    collection = @app_institution.negotiations.includes(:course,:status).order(:name)
    @pagy, @app_negotiations = set_pagy(collection)
    set_counters(@app_negotiations)
    render :index
  end

  private
    
    def set_institution 
       @app_institution = App::Institution.find(params[:institution_id])
    end

    def set_negotiations
      @app_negotiations = @app_institution.negotiations.includes(:course,:status).order(:name)
    end

    def set_contant_for_sidebar
      @cities = App::City.by_client(get_client_id).joins(institutions: :courses).distinct.order(:name)
      @institutions = App::Institution.by_client(get_client_id).joins(:courses).order(:abreviation).distinct
      @ae = @app_institution.city.id if @app_institution.present? # area expanded for city
    end

    def set_calendars
      @app_calendars = App::Calendar.by_client(get_client_id).by_calendar_status('active').order(year: :asc, semester: :asc)
    end

    def set_counters(app_negotiations)

      @counters = []
      status_ids =  app_negotiations.present? ? app_negotiations.pluck(:status_id).uniq.to_a : App::StatusNegotiation.by_client(get_client_id).order(:name)
      
      if status_ids.include?(nil) || status_ids.include?('-1')
        status_not_assigned = App::StatusNegotiation.new(name: t('activerecord.blank_entries.status_negotiation'), style:'fa-regular', icon:'circle')
        @counters << [status_not_assigned, app_negotiations.where(status: nil).count]
      end

      status_ids.reject.reject { |status| status == '-1' || status.nil? }.each do |status_id|
        @counters << [App::StatusNegotiation.find(status_id), app_negotiations.where(status_id: status_id).count]
      end

      # status = App::StatusNegotiation.by_client(get_client_id).order(:name)
      # no_status = App::StatusNegotiation.new(name: t('activerecord.blank_entries.status_negotiation'), style:'fa-regular', icon:'circle')
      # if @app_negotiations.present? 
      #   @counters = status.map { |s| [s, @app_negotiations.where(status: s).count] }
      #   @counters << [no_status, @app_negotiations.where(status: nil).count]
      # else
      #   @counters = status.map { |s| [s, 0] }
      #   @counters << [no_status, 0]
      # end
    end
  
end
