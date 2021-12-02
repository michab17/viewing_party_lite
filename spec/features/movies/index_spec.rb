require 'rails_helper'

RSpec.describe 'Discover', :vcr do
  let(:user) { User.create!(name: 'Tom', email: 'user@email.com') }

  before do
    visit user_discover_path(user)
  end

  it 'displays page name' do
    expect(page).to have_content('Discover Movies')
  end

  it 'links to top rated movies' do
    click_button "Find Top Rated Movies"

    expect(current_path).to eq(user_movies_path(user))
  end

  it 'searches the db for the search input' do
    fill_in :search, with: 'phoenix'
    click_button 'Find Movies'

    expect(current_path).to eq(user_movies_path(user))
  end
end
