class MovieService
  def self.get_data(endpoint)
    conn = Faraday.new(url: "https://api.themoviedb.org")
    response = conn.get(endpoint) do |faraday|
      faraday.params["api_key"] = ENV['movie_key']
    end
    data = response.body
    JSON.parse(data, symbolize_names:  true)
  end

  def self.top
    first20 = get_data("/3/movie/top_rated?language=en-US&page=1")
    last20 = get_data("/3/movie/top_rated?language=en-US&page=2")
    first20[:results] + last20[:results]
  end

  def self.search(term)
    first20 = get_data("/3/search/movie?language=en-US&query=#{term}&page=1")
    last20 = get_data("/3/search/movie?language=en-US&query=#{term}&page=2")

    first20[:results] + last20[:results]
  end

  def self.find_by_id(id)
    movie = get_data("https://api.themoviedb.org/3/movie/#{id}")
  end

  def self.get_cast(movie_id)
    cast = get_data("https://api.themoviedb.org/3/movie/#{movie_id}/credits")
  end

  def self.get_reviews(movie_id)
    review = get_data("https://api.themoviedb.org/3/movie/#{movie_id}/reviews")
  end
end
