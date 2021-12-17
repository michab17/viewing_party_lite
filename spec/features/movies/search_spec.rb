require 'rails_helper'

RSpec.describe 'Movie Search', :vcr do
  let(:user) { User.create!(name: 'Tom', email: 'user@email.com', password: 'password', password_confirmation: 'password') }
  before :each do
    visit login_path
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Login'
  end

  describe 'arrive from button' do
    before do
      visit discover_path

      click_button "Find Top Rated Movies"
    end

    it 'shows the title' do
      expect(page).to have_content('Top Rated Movies')
    end

    it 'links back to discover page' do
      click_button 'Discover Page'

      expect(current_path).to eq(discover_path)
    end
  end

  describe 'arrive from searchbar' do
    before do
      visit discover_path

      fill_in :search, with: 'phoenix'
      click_button 'Find Movies'
    end

    it 'shows the title' do
      expect(page).to have_content('Movie Results for: phoenix')
    end

    it 'links back to discover page' do
      click_button 'Discover Page'

      expect(current_path).to eq(discover_path)
    end
  end

  describe 'arrive from manual entry' do
    it 'redirects to discover' do
      visit movies_path

      expect(current_path).to eq(discover_path)
    end
  end

  describe 'results' do
    it 'links to a movies show page' do
      visit discover_path

      fill_in :search, with: 'Atomic'
      click_button 'Find Movies'
      click_link 'Atomic Blonde'

      expect(current_path).to eq("/movies/341013")
    end
  end
end
