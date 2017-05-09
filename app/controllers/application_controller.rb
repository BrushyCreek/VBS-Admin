class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "public"
    else
      "application"
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :admin])
  end

end
