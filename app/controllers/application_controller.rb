class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :store_user_location!, if: :storable_location?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
  end

  def user_root_path
    profile_path
  end

  def after_sign_in_path_for(resource)
    session["user_return_to"] || root_path
  end
  # def storable_location?
  #   request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  # end

  # def store_user_location!
  #   store_location_for(:user, request.fullpath)
  # end

  # def after_sign_in_path_for(resource_or_scope)
  #   stored_location_for(resource_or_scope) || super
  # end

end
