class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :genre_string

  def initialize(data)
    @id           = data[:id]
    @title        = data[:title]
    @vote_average = data[:vote_average]
    @runtime      = data[:runtime]
    @genres       = data[:genres]
    @genre_string = genre_string
  end

  def genre_string
    genres = ''
    @genres.each do |genre|
      genres += "#{genre[:name]}, "
    end
    genres[0..-2]
  end
end
