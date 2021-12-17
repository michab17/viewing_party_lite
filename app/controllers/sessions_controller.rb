class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to login_path, notice: "Email or password was incorrect"
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  private

  def session_params
    # params.require()permit()
  end
end