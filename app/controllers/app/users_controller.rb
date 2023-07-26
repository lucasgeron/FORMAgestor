  class App::UsersController < ApplicationController
    include App::UsersHelper

    before_action :authenticate_user_or_admin!
    before_action :check_client_id, only: %i[ show edit update destroy ]
    before_action :set_user, only: %i[ show edit update destroy ]


    # GET /users or /users.json
    def index
      @app_users = App::User.by_client(get_client_id)
      @client_id = get_client_id
    end

    # GET /users/1 or /users/1.json
    def show
    end

    # GET /users/new
    def new
      @app_user = App::User.new
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users or /users.json
    def create
      
      @app_user = App::User.new(user_params)
      set_client_id(@app_user)

        if (can_save?(@app_user.active) && @app_user.save )
            flash[:success] = t('views.app.general.flash.create', model: @app_user.class.model_name.human)
            redirect_to app_user_url(@app_user)
        else
            render :new, status: :unprocessable_entity
        end

    end

   # PATCH/PUT /users/1 or /users/1.json
    def update
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
      flash[:success] = t('views.app.general.flash.destroy', model: @app_user.class.model_name.human)
      redirect_to app_users_url 
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
          @app_user = App::User.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:app_user).permit(:email, :password, :password_confirmation, :active)
      end
  end
