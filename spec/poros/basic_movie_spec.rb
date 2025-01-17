require 'rails_helper'

RSpec.describe 'basic movie object' do
  it 'has attributes' do
    movie = BasicMovie.new(basic_movie_data)

    expect(movie.title).to eq("Dilwale Dulhania Le Jayenge")
    expect(movie.vote_average).to eq(8.7)
    expect(movie.id).to eq(19404)
  end
end
