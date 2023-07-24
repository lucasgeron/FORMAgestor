module App
  class UsersController < ApplicationController

    before_action :authenticate_user_or_admin!

    before_action :set_user, only: %i[ show edit update destroy ]

    # GET /users or /users.json
    def index
      # @users = User.all 
      @users = User.by_client(current_user.client_id) if (current_user && current_user.client_id)
      @users = User.all if current_admin
    end

    # GET /users/1 or /users/1.json
    def show
      
    end

    # GET /users/new
    def new
      if current_admin || (current_user && current_user.client.has_available_license?)
        @user = User.new
      else  
        flash[:error] = "You don't have available licenses"
        redirect_to app_users_url
      end

      # @user = User.new
      
    end

    # GET /users/1/edit
    def edit
      
    end

    # POST /users or /users.json
    def create
      
      @user = User.new(user_params)

      respond_to do |format|
        
        if @user.client.available_licenses >= 0

          if @user.active == true && @user.client.available_licenses <= 0
            format.html do
              flash.now[:error] = "Não existem licensas disponíveis para #{@user.client.name}, só é possível criar o usuário inativo."
              render :new, status: :unprocessable_entity
            end
          elsif ( is_client_scope?(user_params[:client_id]) &&  @user.save )
            format.html do  
              flash[:success] = "User was successfully created."
              redirect_to app_user_url(@user)
            end
          else
            format.html { render :new, status: :unprocessable_entity }
          end

        
        else
          format.html do
            flash.now[:error] = "Não existem licensas disponíveis para #{@user.client.name}"
            render :new, status: :unprocessable_entity
          end
        end
      end

    end

    # PATCH/PUT /users/1 or /users/1.json
    def update

      respond_to do |format|

        # garante que o o cliente tem licenças
        if @user.client.available_licenses >= 0 

          #  se o usuário estiver inativo for ativado  e o cliente tiver licenças disponíveis
          if ((@user.active == false && user_params[:active] == '1') && @user.client.available_licenses <= 0)
            format.html do
              flash.now[:error] = "Não existem licensas disponíveis para #{@user.client.name}. Considere liberar uma licença antes de ativar este usuário."
              render :edit, status: :unprocessable_entity
            end
          elsif ( is_client_scope?(user_params[:client_id]) && @user.update(user_params) )
            format.html do 
              flash[:success] = "User was successfully updated."
              redirect_to app_user_url(@user)
            end
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
         
        else
          format.html do
          flash.now[:error] = "Não existem licensas disponíveis para #{@user.client.name}."
          render :edit, status: :unprocessable_entity
          end
        end

      end
    end

    # DELETE /users/1 or /users/1.json
    def destroy
      @user.destroy

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
        @user = User.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :client_id, :active)
      end
  end
end
