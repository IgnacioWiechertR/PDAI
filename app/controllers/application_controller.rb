class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    if resource.is_a?(Business)
      business_path(resource)
      
    else
      super # Si es un usuario normal, sigue el flujo por defecto (root_path)
    end
  end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :age, :comuna])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :age, :comuna])
  end
end