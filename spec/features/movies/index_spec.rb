require 'rails_helper'

RSpec.describe 'Discover', :vcr do
  let(:user) { User.create!(name: 'Tom', email: 'user@email.com', password: 'password', password_confirmation: 'password') }

  before :each do
    visit login_path
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Login'
    visit '/discover'
  end

  it 'displays page name' do
    expect(page).to have_content('Discover Movies')
  end

  it 'links to top rated movies' do
    click_button "Find Top Rated Movies"

    expect(current_path).to eq('/movies')
  end

  it 'searches the db for the search input' do
    fill_in :search, with: 'phoenix'
    click_button 'Find Movies'

    expect(current_path).to eq('/movies')
  end
end
