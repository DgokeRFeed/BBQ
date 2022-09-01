class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:password, :password_confirmation, :current_password)
    end
  end

  def current_user_can_edit?(event)
    user_signed_in? && event.user == current_user
  end
end
