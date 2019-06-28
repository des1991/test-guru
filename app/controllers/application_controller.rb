class ApplicationController < ActionController::Base
  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    unless logged_in?
      cookies[:redirect_path] = request.fullpath

      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
