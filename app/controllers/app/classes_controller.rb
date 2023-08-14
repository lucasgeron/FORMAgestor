class App::ClassesController < ApplicationController
    before_action :set_contant_for_sidebar, only: %i[ index search ]
    before_action :set_calendars, only: %i[ index search ]

  # GET /app/negotiations or /app/negotiations.json
  def index

   

  end

  # GET /app/negotiations/search
  def search

    @app_institution = App::Institution.find(params[:institution_id])
    collection = @app_institution.negotiations.order(:name)


    # collection = App::Negotiation.by_client(get_client_id).joins(:course).order('app_courses.name')
    
    # if params[:institution_id].present?
    #   collection = collection.search(params[:query])
    #   params[:status_ids] = collection.pluck(:status_id).uniq
    #   params[:vendor_ids] = collection.pluck(:vendor_id).uniq
    #   # code to replace sidebar content
    # elsif params[:status_ids].present? || params[:vendor_ids].present?
    # else
    #   return redirect_to app_negotiations_path
    # end
    
    @ae = @app_institution.city.id


    @pagy, @app_negotiations = set_pagy(collection)

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
      @cities = App::City.by_client(get_client_id).joins(:institutions).order(:name).uniq
      @institutions = App::Institution.by_client(get_client_id).order(:abreviation)
    end

    def set_calendars
      @app_calendars = App::Calendar.by_client(get_client_id).by_calendar_status('active').order(year: :asc, semester: :asc)
    end
  
end
