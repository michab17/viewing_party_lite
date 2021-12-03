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
    redirect_to user_path(user)
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end

