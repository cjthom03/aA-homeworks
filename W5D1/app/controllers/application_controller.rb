class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login!(user)
    @current_user = user
    session[:session_token] = user.reset_session_token
  end

  def logout
    current_user.reset_session_token
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def ensure_log_in
    redirect_to new_session_url unless self.logged_in?
  end

  def ensure_log_out
    redirect_to bands_url if self.logged_in?
  end

end
