class App::ClientsController < ApplicationController
    
    before_action :authenticate_admin!
    before_action :set_client, only: %i[ show edit update destroy destroy_attachment]

    # GET /clients or /clients.json
    def index
      collection = App::Client.all.order(:name)
      @pagy,  @app_clients = set_pagy(collection)
      @job = params[:job_id] if params[:job_id].present?
    end

    # GET /clients/1 or /clients/1.json
    def show
    end

    # GET /clients/new
    def new
      @app_client = App::Client.new
    end

    # GET /clients/1/edit
    def edit
    end

    # POST /clients or /clients.json
    def create
      @app_client = App::Client.new(client_params)

        if @app_client.save
          ClientSetupJob.perform_now(@app_client)
          flash[:success] = t('views.app.general.flash.create_m', model: App::Client.model_name.human)
          redirect_to app_client_url(@app_client)
        else
          render :new, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /clients/1 or /clients/1.json
    def update
      if @app_client.update(client_params)
        flash[:success] = t('views.app.general.flash.update_m', model: App::Client.model_name.human)
        redirect_to app_client_url(@app_client)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /clients/1 or /clients/1.json
    def destroy
      if @app_client.users.count == 0 
        @app_client.destroy
        flash[:success] = t('views.app.general.flash.destroy_m', model: App::Client.model_name.human)
        redirect_to app_clients_url
      else
        flash[:error] = t('views.app.clients.flash.destroy_failed_m', model: App::Client.model_name.human)
        redirect_to app_client_url(@app_client)
      end
    end

    # DELETE /clients/1/destroy_attachment
    def destroy_attachment
      if @app_client.image.attached? 
        @app_client.image.purge
        flash[:success] = t('views.app.general.flash.destroy_attachment_f', model: t('activerecord.attributes.app/client.image'))
        redirect_to app_client_path(@app_client)
      else 
        flash.now[:error] = t('views.app.clients.flash.destroy_attachment_failed_f', model: t('activerecord.attributes.app/client.image'))
        render :edit, status: :unprocessable_entity
      end
    end

    # GET /clients/seach?query=:query?status=:status
    def search
      collection = App::Client.all.order(:name)
      collection = collection.search(params[:query]) if params[:query].present?
      collection = collection.by_client_status(params[:status]) if params[:status].present?
      
      @pagy,  @app_clients = set_pagy(collection)
      render :index
    end

  # POST /app/clients/:id/recalculate_periods
  def recalculate_periods
    job = NegotiationPeriodCalculatorJob.set(wait: 1.seconds).perform_later("The job has been completed successfully!")
    redirect_to app_clients_path(job_id: job.job_id)
  end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_client
        @app_client = App::Client.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def client_params
        params.require(:app_client).permit(:name, :cnpj, :active, :licenses, :slug, :image)
      end
  end