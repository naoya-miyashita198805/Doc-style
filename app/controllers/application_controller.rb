class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :set_current_user

  # def set_current_user
  #   @current_user = Document.find_by(params[:id])
  #   # params[:id] id: session[:user_id]
  # end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
