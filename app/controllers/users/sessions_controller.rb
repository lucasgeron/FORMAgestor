# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  before_action :check_client_active, only: [:create]
  before_action :check_user_active, only: [:create]

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super do |user|
      flash.clear
      flash[:info] = t('devise.sessions.signed_in')
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super do |user|
      flash.clear
      flash[:info] = t('devise.sessions.signed_out')
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def check_client_active
    unless current_user.client.active
      flash[:error] = t('views.sessions.client_not_active', client: current_user.client.name)
      sign_out current_user
      redirect_to new_user_session_path
    end
  end

  def check_user_active
    unless current_user.active
      flash[:error] =  t('views.sessions.user_not_active', client: current_user.client.name, email: current_user.email)
      sign_out current_user
      redirect_to new_user_session_path
    end
  end


end
