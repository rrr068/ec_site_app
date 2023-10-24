class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, except: [:home]
  
  
  def after_sign_out_path_for(resource)
    flash[:notice] = "Signed out successfully."
     root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
