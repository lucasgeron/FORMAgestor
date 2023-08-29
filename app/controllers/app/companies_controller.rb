class App::CompaniesController < ApplicationController

  before_action :authenticate_user_or_admin!
  before_action :check_client_id, only: %i[ show edit update destroy ]
  before_action :set_app_company, only: %i[ show edit update destroy ]

  # GET /app/companies or /app/companies.json
  def index
    collection = App::Company.by_client(get_client_id).order(:name)
    @pagy,  @app_companies = set_pagy(collection)
  end

  # GET /app/companies/1 or /app/companies/1.json
  def show
  end

  # GET /app/companies/new
  def new
    @app_company = App::Company.new(active:true)
  end

  # GET /app/companies/1/edit
  def edit
  end

  # POST /app/companies or /app/companies.json
  def create
    @app_company = App::Company.new(app_company_params)
    set_client_id(@app_company)

    if @app_company.save
      flash[:success] = t('views.app.general.flash.create_f', model: App::Company.model_name.human)
      redirect_to app_company_url(@app_company)
    else
      render :new, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /app/companies/1 or /app/companies/1.json
  def update
    if @app_company.update(app_company_params)
      flash[:success] = t('views.app.general.flash.update_f', model: App::Company.model_name.human)
      redirect_to app_company_url(@app_company)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /app/companies/1 or /app/companies/1.json
  def destroy
    if @app_company.has_dependency?
      flash[:error] = t('views.app.general.flash.destroy_failed_f', model: App::Company.model_name.human)
      redirect_to @app_company
    else
      @app_company.destroy
      flash[:success] = t('views.app.general.flash.destroy_f', model: App::Company.model_name.human)
      redirect_to app_companies_url
    end
  end

    #  GET /app/companies/search?query=:query&status=:status
    def search 

      collection = App::Company.by_client(get_client_id)
  
      collection = collection.by_company_status(params[:status])
      collection = collection.search(params[:query].to_s) if params[:query].present?
  
      @pagy,  @app_companies = set_pagy(collection)
      
      render :index
  
    end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_company
      @app_company = App::Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_company_params
      params.require(:app_company).permit(:name, :active, :client_id)
    end
end
