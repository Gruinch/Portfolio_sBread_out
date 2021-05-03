class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_paramaters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name][:introduction][:img][:is_deleted])
  end
end
