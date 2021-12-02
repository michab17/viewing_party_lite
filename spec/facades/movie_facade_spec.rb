require 'rails_helper'

RSpec.describe 'movie facade' do
  it 'gets the top movies and creates objects', :vcr do
    movie_list = MovieFacade.get_top
    first_movie = movie_list.first

    expect(movie_list).to be_an Array
    expect(first_movie).to be_a Movie
  end

  it 'gets the searched movies and creates objects', :vcr do
    movie_list = MovieFacade.get_search('Atomic')
    first_movie = movie_list.first

    expect(movie_list).to be_an Array
    expect(first_movie).to be_a Movie
    expect(first_movie.title).to include('Atomic')
  end
end
