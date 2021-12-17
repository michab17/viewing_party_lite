class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  private

  def require_user
    if !current_user
      flash[:notice] = "Must log in or register before accessing this page"
      redirect_to root_path
    end
  end
end
