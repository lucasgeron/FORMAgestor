module App
  class ClientsController < ApplicationController
    
    before_action :authenticate_admin!
    before_action :set_client, only: %i[ show edit update destroy ]

    # GET /clients or /clients.json
    def index
      @clients = Client.all
    end

    # GET /clients/1 or /clients/1.json
    def show
    end

    # GET /clients/new
    def new
      @client = Client.new
    end

    # GET /clients/1/edit
    def edit
    end

    # POST /clients or /clients.json
    def create
      @client = Client.new(client_params)

        if @client.save
          flash[:success] = "Client was successfully created."
          redirect_to app_client_url(@client)
        else
          render :new, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /clients/1 or /clients/1.json
    def update
      if @client.update(client_params)
        flash[:success] = "Client was successfully updated."
        redirect_to app_client_url(@client)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /clients/1 or /clients/1.json
    def destroy
      if @client.users.count == 0 
        @client.destroy
        flash[:success] = "Client was successfully destroyed."
        redirect_to app_clients_url
      else
        flash[:error] = "Client was not destroyed, because it has users."
        redirect_to app_client_url(@client)
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_client
        @client = Client.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def client_params
        params.require(:client).permit(:name, :cnpj, :active, :licenses)
      end
  end
end
