class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :log_in_user!, :reset_session_token!
  #before_action :require_login

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_in_user!(user)
    @current_user = user
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def reset_session!
    session[:session_token] = nil
    @current_user = nil
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_session_url
    end
  end

  def logout!
     current_user.reset_session_token! unless current_user.nil?
     session[:session_token] = nil
  end

end
