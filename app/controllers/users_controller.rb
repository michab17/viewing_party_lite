class UsersController < ApplicationController
  before_action :require_user, only: [:show]
  def show
    @user = User.find(current_user.id)
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
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to register_path, notice: "Information you entered was invalid"
    end
  end



  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end

