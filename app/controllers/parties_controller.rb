class PartiesController < ApplicationController
  before_action :require_user

  def new
    @user = User.find(current_user.id)
    @movie = MovieFacade.find_movie(params[:movie_id])
    @users = User.all.to_a - [@user]
  end

  def create
    @user = User.find(current_user.id)
    @movie = MovieFacade.find_movie(params[:movie_id])
    #line 13 should be a validation on the model
    party = Party.new(party_params)
    party.movie = @movie
    if party.save
      party.user_parties.create!(user_id: current_user.id, party_id: party.id)
      # array = User.all.map do |user|
      #   user.name
      # end
      user_names = User.pluck(:name)
      # fields_for user emails 
      # find all params with value of 1, find the user associated with that param, create a party for that user

      params.each do |param|
        if array.include? param.first
          if param.last == 1
            party.user_parties.create!(user_id: (User.find_by(name: param.first)), party_id: party.id)
          end
        end
      end
      redirect_to dashboard_path
    else
      redirect_to "/movies/#{@movie.id}/parties/new"
      flash[:alert] = "Error: Duration must be longer than the movie"
    end
  end

  private

  def party_params
    params.require(:party).permit(:movie_id, :duration, :date, :time, :status)
  end
end
