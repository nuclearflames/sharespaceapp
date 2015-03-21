class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def authenticate_current_user!
    if current_user != @user
      redirect_to root_path, :notice => "Not yours to access!"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :name, :tagline, :email, :password, :password_confirmation ) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :name, :tagline, :email, :password, :password_confirmation, :current_password ) }
  end
end
