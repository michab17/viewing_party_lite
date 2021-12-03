class MovieFacade
  class << self
    def get_top
      @movies = MovieService.top
      @movies.map do |movie_data|
        BasicMovie.new(movie_data)
      end
    end

    def get_search(term)
      @movies = MovieService.search(term)
      @movies.map do |movie_data|
        BasicMovie.new(movie_data)
      end
    end

    def find_movie(id)
      movie_data = MovieService.find_by_id(id)
      movie = Movie.new(movie_data)
    end

    def cast(movie_id)
      cast = MovieService.get_cast(movie_id)[:cast][0..9]
      cast.map do |actor_data|
        Actor.new(actor_data)
      end
    end

    def reviews(movie_id)
      reviews = MovieService.get_reviews(movie_id)[:results]
      reviews.map do |review_data|
        Review.new(review_data)
      end
    end
  end
end
