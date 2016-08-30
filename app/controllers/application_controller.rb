class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logined!, :current_user

  def logined!
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    unless logined!
      redirect_to login_path
    end
  end

end
