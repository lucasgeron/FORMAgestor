  class App::UsersController < ApplicationController
<<<<<<< HEAD
    include App::UsersHelper

    before_action :authenticate_user_or_admin!
    before_action :check_client_id, only: %i[ show edit update destroy ]
=======

    before_action :authenticate_user_or_admin!

    # grants access only to admin, or to users that are in the same client scope
    before_action :check_client_id, only: %i[ show edit update destroy], unless: proc { current_admin }

>>>>>>> a759820c143df7d3a776df8e9a3c7abc5a3072c6
    before_action :set_user, only: %i[ show edit update destroy ]


    # GET /users or /users.json
    def index
<<<<<<< HEAD
      @app_users = App::User.by_client(get_client_id)
      @client_id = get_client_id
=======
      @app_users = App::User.by_client(current_user.client_id) if (current_user && current_user.client_id)
      @app_users = App::User.all if current_admin
>>>>>>> a759820c143df7d3a776df8e9a3c7abc5a3072c6
    end

    # GET /users/1 or /users/1.json
    def show
    end

    # GET /users/new
    def new
<<<<<<< HEAD
      @app_user = App::User.new
=======
      if current_admin || (current_user && current_user.client.has_available_license?)
        @app_user = App::User.new
      else  
        flash[:error] = "You don't have available licenses"
        redirect_to app_users_url
      end      
>>>>>>> a759820c143df7d3a776df8e9a3c7abc5a3072c6
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users or /users.json
    def create
      
<<<<<<< HEAD
      @app_user = App::User.new(user_params)
      set_client_id(@app_user)

        if (can_save?(@app_user.active) && @app_user.save )
            flash[:success] = t('views.app.general.flash.create', model: @app_user.class.model_name.human)
            redirect_to app_user_url(@app_user)
        else
            render :new, status: :unprocessable_entity
=======
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
>>>>>>> a759820c143df7d3a776df8e9a3c7abc5a3072c6
        end

    end

   # PATCH/PUT /users/1 or /users/1.json
    def update
<<<<<<< HEAD
      if can_save?(to_b(user_params[:active]))
        updated = if user_params[:password].present?
                    # update with password
                    password_updated = true
                    @app_user.update(user_params)
                  else
                    # update without password
                    password_updated = false
                    @app_user.update_without_password(user_params)
                  end
      end
=======
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
>>>>>>> a759820c143df7d3a776df8e9a3c7abc5a3072c6

      if updated
        flash[:success] = "#{t('views.app.general.flash.update', model: @app_user.class.model_name.human)} #{password_updated ? t('views.app.users.flash.password_updated') : t('views.app.users.flash.password_not_updated')}"
        redirect_to app_user_url(@app_user)
      else
        render :edit, status: :unprocessable_entity
      end
    end


    # DELETE /users/1 or /users/1.json
    def destroy
      @app_user.destroy
<<<<<<< HEAD
      flash[:success] = t('views.app.general.flash.destroy', model: @app_user.class.model_name.human)
      redirect_to app_users_url 
=======

      respond_to do |format|

        format.html do
          flash[:success] = "User was successfully destroyed."
          redirect_to app_users_url 
        end 
        format.json { head :no_content }
      end
>>>>>>> a759820c143df7d3a776df8e9a3c7abc5a3072c6
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
<<<<<<< HEAD
          @app_user = App::User.find(params[:id])
=======
        if App::User.exists?(params[:id])
          @app_user = App::User.find(params[:id])
        else
          flash[:error] = "User not found"
          redirect_to app_users_url
        end
>>>>>>> a759820c143df7d3a776df8e9a3c7abc5a3072c6
      end

      # Only allow a list of trusted parameters through.
      def user_params
<<<<<<< HEAD
        params.require(:app_user).permit(:email, :password, :password_confirmation, :active)
=======
        params.require(:app_user).permit(:email, :password, :password_confirmation, :client_id, :active)
>>>>>>> a759820c143df7d3a776df8e9a3c7abc5a3072c6
      end
  end
