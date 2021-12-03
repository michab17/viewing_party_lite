class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.find_movie(params[:movie_id])
    @users = User.all.to_a - [@user]
  end

  def create
    @user = User.find(params[:user_id])
    @movie = MovieFacade.find_movie(params[:movie_id])

    if @movie.runtime <= params[:duration].to_i
      party = Party.create!(host_id: @user.id, movie_id: @movie.id, date: params[:day], time: params[:time])

      UserParty.create!(user_id: params[:user_id], party_id: party.id)
      redirect_to user_path(@user)
    else
      redirect_to new_user_movie_party_path(@user, @movie.id)
      flash[:alert] = "Error: Duration must be longer than the movie"
    end
  end

  private

  def party_params
    params.permit(:movie_id, :date, :time, :status)
  end
end
