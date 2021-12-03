class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def search
    @user = User.find(params[:user_id])
    if params[:q]
      @movies = MovieFacade.get_top
      render '/partials/_top_rated.html.erb'
    elsif params[:search]
      @result = params[:search]
      @movies = MovieFacade.get_search(@result)
      render '/partials/_search_results.html.erb'
    else
      redirect_to user_discover_path(@user)
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.find_movie(params[:id])
  end
end
