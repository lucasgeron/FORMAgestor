  class App::UsersController < ApplicationController

    before_action :authenticate_user_or_admin!
    before_action :check_client_id, only: %i[ show edit update destroy ]
    before_action :set_user, only: %i[ show edit update destroy ]
    before_action :can_edit?, only: %i[ edit ]


    # GET /users or /users.json
    def index
      collection = App::User.by_client(get_client_id).order(:email)
      @pagy,  @app_users = set_pagy(collection)
    end

    # GET /users/1 or /users/1.json
    def show
    end

    # GET /users/new
    def new
      if current_access_is_admin? && params[:client_id].present?
        flash.now[:success] = t('views.app.admins.flash.update_client', client: get_current_access.client.name)
        current_admin.update(client_id: params[:client_id])
      end
      @app_user = App::User.new
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users or /users.json
    def create

      @app_user = App::User.new(user_params)
      set_client_id(@app_user)

        if (can_create?(@app_user.active) && @app_user.save )
            flash[:success] = t('views.app.general.flash.create_m', model: @app_user.class.model_name.human)
            redirect_to app_user_url(@app_user)
        else
            render :new, status: :unprocessable_entity
        end

    end

   # PATCH/PUT /users/1 or /users/1.json
    def update
      if can_update?(@app_user.active, to_b(user_params[:active]))
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
        flash[:success] = "#{t('views.app.general.flash.update_m', model: @app_user.class.model_name.human)} #{password_updated ? t('views.app.users.flash.password_updated') : t('views.app.users.flash.password_not_updated')}"
        
        if current_access_is_same_user?
           sign_out(get_current_access)
           redirect_to new_user_session_url
        else
           redirect_to app_user_url(@app_user)
        end

      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /users/1 or /users/1.json
    def destroy
      if @app_user.has_dependency?
        flash[:error] = t('views.app.general.flash.destroy_failed_m', model:  App::User.model_name.human)
        redirect_to @app_user
      else
        @app_user.destroy
        flash[:success] = t('views.app.general.flash.destroy_m', model:  App::User.model_name.human)
        redirect_to app_users_url 
      end
    end

    # GET /users/search?query=:query?status=:status
    def search
      
      collection = App::User.by_client(get_client_id).order(:email)
      
      collection = collection.search(params[:query]) if params[:query].present?
      collection = collection.by_user_status(params[:status]) if params[:status].present?
      

      @pagy,  @app_users = set_pagy(collection)
      render :index
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
          @app_user = App::User.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:app_user).permit(:email, :password, :password_confirmation, :active, :vendor_id)
      end

      def current_access_is_same_user?
        get_current_access.id == @app_user.id ? true : false
      end

      def can_edit? 
        @permission_to_edit = get_current_access.id == @app_user.id ? true : false
      end

      def can_create?(active)
        unless get_current_access.client.available_licenses > 0 || (get_current_access.client.available_licenses.zero? && active == false)
          flash.now[:error] = t('views.app.users.flash.no_license_available', client:get_current_access.client.name)
          flash.now[:info] = action_name == 'create' ? t('views.app.users.flash.tip_for_create').html_safe : t('views.app.users.flash.tip_for_update').html_safe
          return false
        end
        true
      end

      def can_update?(current_active, update_active)
         if get_current_access.client.available_licenses > 0
          return true
         elsif  (current_active == update_active) || (current_active == true && update_active == false)
            return true
         else 
            flash.now[:error] = t('views.app.users.flash.no_license_available', client:get_current_access.client.name)
            flash.now[:info] = t('views.app.users.flash.tip_for_update').html_safe
            return false
          end
      end        
  end
