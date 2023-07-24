# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    
    super do |user|
      flash.clear

      # Validate if client is active
      if !user.client.active
        flash[:error] = "Your client is not active"
        sign_out user
        return redirect_to new_user_session_path
      end

      # Validate if user is active
      if !user.active
        flash[:error] = "Your user is not active"
        sign_out user
        return redirect_to new_user_session_path
      end

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
end
