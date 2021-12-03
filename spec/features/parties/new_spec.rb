require 'rails_helper'

RSpec.describe 'new party page', :vcr do
  let!(:user) { User.create!(name: 'Tom', email: 'user@email.com') }
  let!(:user2) { User.create!(name: 'John', email: 'user2@email.com') }
  let!(:user3) { User.create!(name: 'Jane', email: 'user3@email.com') }

  before do
    visit new_user_movie_party_path(user, 155)
  end

  describe 'layout' do
    it 'displays the movie title' do
      expect(page).to have_content('Create Viewing Party for The Dark Knight')
    end

    it 'has a link to discover page' do
      click_button 'Discover Page'

      expect(current_path).to eq(user_discover_path(user))
    end
  end

  describe 'form' do
    describe 'when given valid information', :vcr do
      it 'creates a new viewing party' do
        fill_in :duration, with: 160
        fill_in :day, with: "01/22/2022"
        fill_in :time, with: "0715p"
        check 'John'

        click_button 'Create Party'

        party = Party.find_by(movie_id: 155, host_id: user.id)

        expect(current_path).to eq(user_path(user))
        expect(party).to be_a Party
      end
    end

    describe 'when given invalid information' do
      describe 'fails to create a party' do
        it 'doesn\'t create a new viewing party' do
          fill_in :duration, with: 140
          fill_in :day, with: 3.days.from_now
          fill_in :time, with: "0715p"
          check 'John'
          click_button 'Create Party'
          
          expect(current_path).to eq(new_user_movie_party_path(user, 155))
          expect(page).to have_content('Error')
        end
      end
    end
  end
end
