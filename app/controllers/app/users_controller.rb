  class App::UsersController < ApplicationController

    before_action :authenticate_user_or_admin!

    # grants access only to admin, or to users that are in the same client scope
    before_action :check_client_id, only: %i[ show edit update destroy], unless: proc { current_admin }

    before_action :set_user, only: %i[ show edit update destroy ]

    # GET /users or /users.json
    def index
      @app_users = App::User.by_client(current_user.client_id) if (current_user && current_user.client_id)
      @app_users = App::User.all if current_admin
    end

    # GET /users/1 or /users/1.json
    def show
    end

    # GET /users/new
    def new
      if current_admin || (current_user && current_user.client.has_available_license?)
        @app_user = App::User.new
      else  
        flash[:error] = "You don't have available licenses"
        redirect_to app_users_url
      end      
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users or /users.json
    def create
      
      params[:app_user][:client_id] = current_user.client_id if current_user
      
      @app_user = App::User.new(user_params)

        if @app_user.client.available_licenses >= 0
          if @app_user.active == true && @app_user.client.available_licenses <= 0
              flash.now[:error] = "Não existem licensas disponíveis para #{@app_user.client.name}, só é possível criar o usuário inativo."
              render :new, status: :unprocessable_entity
          elsif ( @app_user.save )
              flash[:success] = "User was successfully created."
              redirect_to app_user_url(@app_user)
          else
              render :new, status: :unprocessable_entity
          end
        end
       

    end

    # PATCH/PUT /users/1 or /users/1.json
    def update
      params[:app_user][:client_id] = current_user.client_id if current_user
      
      respond_to do |format|
        # garante que o o cliente tem licenças
        if @app_user.client.available_licenses >= 0 

          #  se o usuário estiver inativo for ativado  e o cliente tiver licenças disponíveis
          if ((@app_user.active == false && user_params[:active] == '1') && @app_user.client.available_licenses <= 0)
            format.html do
              flash.now[:error] = "Não existem licensas disponíveis para #{@app_user.client.name}. Considere liberar uma licença antes de ativar este usuário."
              render :edit, status: :unprocessable_entity
            end
          elsif ( @app_user.update_without_password(user_params) )
            format.html do 
              flash[:success] = "User was successfully updated."
              redirect_to app_user_url(@app_user)
            end
            format.json { render :show, status: :ok, location: @app_user }
          elsif ( @app_user.update(user_params) )
            format.html do 
              flash[:success] = "User was successfully updated. (Senha não alterada)"
              redirect_to app_user_url(@app_user)
            end
            format.json { render :show, status: :ok, location: @app_user }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @app_user.errors, status: :unprocessable_entity }
          end
         
        else
          format.html do
          flash.now[:error] = "Não existem licensas disponíveis para #{@app_user.client.name}."
          render :edit, status: :unprocessable_entity
          end
        end

      end
    end

    # DELETE /users/1 or /users/1.json
    def destroy
      @app_user.destroy

      respond_to do |format|

        format.html do
          flash[:success] = "User was successfully destroyed."
          redirect_to app_users_url 
        end 
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        if App::User.exists?(params[:id])
          @app_user = App::User.find(params[:id])
        else
          flash[:error] = "User not found"
          redirect_to app_users_url
        end
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:app_user).permit(:email, :password, :password_confirmation, :client_id, :active)
      end
  end
