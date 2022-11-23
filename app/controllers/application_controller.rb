class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  def current_user
    current_customer
  end

  # Catch all CanCan errors and alert the customer of the exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
