class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @hosting_parties = UserParty.where(user_id: @user.id)
    @parties = []
    @hosting_parties.each do |user_party|
      @parties << Party.find(user_party.party_id)
    end
  end
  
  def new
  end

  def create
    user = User.create(user_params)
    if user.save
      redirect_to user_path(user)
    else
      redirect_to register_path, notice: "Information you entered was invalid"
    end
  end

  def login_form
  end

  def login_user
    if User.find_by email: params[:email]
      user = User.find_by email: params[:email]
      if user.authenticate(params[:password])
        redirect_to user_path(user)
      else
        redirect_to login_path, notice: "Email or password was incorrect"
      end
    else
      redirect_to login_path, notice: "Email or password was incorrect"
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end

