class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:token])
  end

  def logged_in?
    !!(current_user)
  end

  def logout!
    current_user.reset_session_token
    session[:token] = nil
  end

  def login!(user)
    session[:token] = user.reset_session_token
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

  def user_params
    params.require(:user).permit(:password, :username)
  end
end
