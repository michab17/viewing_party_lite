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
end
