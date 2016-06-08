class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :service
    devise_parameter_sanitizer.for(:sign_up) << :twitter_id
    devise_parameter_sanitizer.for(:sign_up) << :id_twitter
    devise_parameter_sanitizer.for(:sign_up) << :facebook_id
    devise_parameter_sanitizer.for(:sign_up) << :id_facebook
    devise_parameter_sanitizer.for(:sign_up) << :yahoojp_id
  end
end
