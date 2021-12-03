require 'rails_helper'

RSpec.describe 'basic movie object' do
  it 'has attributes' do
    movie = Movie.new(movie_data)

    expect(movie.title).to eq("The Dark Knight")
    expect(movie.vote_average).to eq(8.5)
    expect(movie.id).to eq(155)
    expect(movie.runtime).to eq(152)
    expect(movie.genre_string).to eq("Drama, Action, Crime, Thriller")
    expect(movie.summary).to eq("Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.")
  end
end
