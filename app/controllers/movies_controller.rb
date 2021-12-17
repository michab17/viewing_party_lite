class MoviesController < ApplicationController
  def index
  end

  def search
    if params[:q]
      @movies = MovieFacade.get_top
      render '/partials/_top_rated.html.erb'
    elsif params[:search]
      @result = params[:search]
      @movies = MovieFacade.get_search(@result)
      render '/partials/_search_results.html.erb'
    else
      redirect_to discover_path
    end
  end

  def show
    @movie = MovieFacade.find_movie(params[:id])
    @cast = MovieFacade.cast(@movie.id)
    @reviews = MovieFacade.reviews(@movie.id)
    @count = MovieFacade.review_count(@movie.id)
  end
end
