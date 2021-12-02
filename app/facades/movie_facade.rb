class MovieFacade
  class << self
    def get_top
      @movies = MovieService.top
      @movies.map do |movie_data|
        Movie.new(movie_data)
      end
    end

    def get_search(term)
      @movies = MovieService.search(term)
      @movies.map do |movie_data|
        Movie.new(movie_data)
      end
    end
  end
end
