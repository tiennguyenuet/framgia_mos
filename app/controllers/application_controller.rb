class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to root_url
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit :name, :user_name,
      :sex, :birthday, :phone_number, :address, :status, :email, :password}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit :name,
      :user_name, :sex, :birthday, :email, :password, :current_password,
      :phone_number, :address, :status}
  end
end
