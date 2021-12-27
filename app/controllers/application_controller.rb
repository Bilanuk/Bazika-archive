class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
  end

  def user_root_path
    profile_path
  end
end
