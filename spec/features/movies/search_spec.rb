require 'rails_helper'

RSpec.describe 'Movie Search' do
  let(:user) { User.create!(name: 'Tom', email: 'user@email.com') }

  describe 'arrive from button' do
    before do
      visit user_discover_path(user)

      click_button "Find Top Rated Movies"
    end

    it 'shows the title' do
      expect(page).to have_content('Top Rated Movies')
    end

    it 'links back to discover page' do
      click_button 'Discover Page'

      expect(current_path).to eq(user_discover_path(user))
    end
  end

  describe 'arrive from searchbar' do
    before do
      visit user_discover_path(user)

      fill_in :search, with: 'phoenix'
      click_button 'Find Movies'
    end

    it 'shows the title' do
      expect(page).to have_content('Movie Results for: phoenix')
    end

    it 'links back to discover page' do
      click_button 'Discover Page'

      expect(current_path).to eq(user_discover_path(user))
    end
  end

  describe 'arrive from manual entry' do
    it 'redirects to discover' do
      visit user_movies_path(user)

      expect(current_path).to eq(user_discover_path(user))
    end
  end
end
