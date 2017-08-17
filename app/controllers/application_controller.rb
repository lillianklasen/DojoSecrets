class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login, only: [:show]

  def current_user
      User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  private
  def require_login
      return redirect_to '/login' unless current_user
  end
end
