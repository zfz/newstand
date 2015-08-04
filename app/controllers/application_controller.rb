class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  #protect_from_forgery with: :null_session
  protect_from_forgery
  helper_method :current_user 

  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end
  
  def require_user 
    redirect_to '/login' unless current_user 
  end
end