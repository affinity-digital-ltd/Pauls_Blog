class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :user, :logged_in?

  def user
    session[:userinfo]
  end

  def logged_in?
    !!user
  end

  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
