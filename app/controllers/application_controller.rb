class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name, :username, :avatar)
  end

#   def after_sign_in_path_for(resource)
#   session["user_return_to"] || posts_show_path
#   end

#   def after_sign_up_path_for(resource)
#     session["user_return_to"] || posts_show_path
#   end
end
