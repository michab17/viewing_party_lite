require 'rails_helper'

RSpec.describe 'movie facade' do
  it 'gets the top movies and creates objects', :vcr do
    movie_list = MovieFacade.get_top
    first_movie = movie_list.first

    expect(movie_list).to be_an Array
    expect(first_movie).to be_a BasicMovie
  end

  it 'gets the searched movies and creates objects', :vcr do
    movie_list = MovieFacade.get_search('Atomic')
    first_movie = movie_list.first

    expect(movie_list).to be_an Array
    expect(first_movie).to be_a BasicMovie
    expect(first_movie.title).to include('Atomic')
  end

  it 'finds a movie based on its id', :vcr do
    movie = MovieFacade.find_movie(155)

    expect(movie).to be_a Movie
    expect(movie.title).to eq('The Dark Knight')
  end

  it 'gets the first ten cast members and creates actor instances', :vcr do
    cast = MovieFacade.cast(155)
    first_actor = cast.first

    expect(cast).to be_an Array
    expect(first_actor).to be_an Actor
    expect(first_actor.name).to eq('Christian Bale')
  end

  it 'gets the first ten cast members and creates actor instances' do  
    VCR.use_cassette('gets the first ten cast members and creates actor instances') do
      review = MovieFacade.reviews(155)
      first_review = review.first

      expect(review).to be_an Array
      expect(first_review).to be_an Review
      expect(first_review.author).to eq('tricksy')
    end
  end
end
