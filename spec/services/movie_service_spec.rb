require 'rails_helper'

RSpec.describe 'movie service' do
  it 'gets data', :vcr do
    endpoint = "/3/movie/top_rated?language=en-US&page=1"
    data = MovieService.get_data(endpoint)

    expect(data).to be_a Hash
  end

  it 'gathers top movie data', :vcr do
    response = MovieService.top
    first_movie = response[0]

    expect(response).to be_an Array
    expect(first_movie[:title]).to be_a String
    expect(first_movie[:vote_average]).to be_a Float
    expect(first_movie[:id]).to be_an Integer
  end

  it 'gathers movie search data', :vcr do
    response = MovieService.search('Atomic')
    first_movie = response[0]

    expect(response).to be_an Array
    expect(first_movie[:title]).to be_a String
    expect(first_movie[:vote_average]).to be_a Float
    expect(first_movie[:id]).to be_an Integer
    expect(first_movie[:title]).to include('Atomic')
  end

  it 'finds a movie by its id', :vcr do
    movie_data = MovieService.find_by_id(155)

    expect(movie_data).to be_a Hash
    expect(movie_data[:title]).to eq('The Dark Knight')
  end

  it 'finds the cast of a movie', :vcr do
    cast_data = MovieService.get_cast(155)

    expect(cast_data).to be_a Hash
    expect(cast_data[:cast][0][:name]).to eq('Christian Bale')
  end

  it 'finds the cast of a movie', :vcr do
    VCR.use_cassette('finds the cast of a movie') do

      review_data = MovieService.get_reviews(155)

      expect(review_data).to be_a Hash
      expect(review_data[:results][0][:author]).to eq('tricksy')
    end
  end
end
