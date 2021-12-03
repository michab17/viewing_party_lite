class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.find_movie(params[:movie_id])
    @users = User.all.to_a - [@user]
  end

  def create
    vp = ViewingParty.create(party_params)
    binding.pry
    if vp.save
      redirect_to user_path(@user)
    else
      redirect_to new_user_movie_party_path(@user, @movie)
    end
  end

  private

  def party_params
    params.permit(:movie_id, :date, :time, :status, :host_id)
  end
end
