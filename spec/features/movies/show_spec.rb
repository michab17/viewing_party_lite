require 'rails_helper'

RSpec.describe 'Movie Show Page', :vcr do
  let(:user) { User.create!(name: 'Tom', email: 'user@email.com') }

  before do
    visit user_discover_path(user)

    click_button "Find Top Rated Movies"
    click_link 'The Dark Knight'
  end

  describe 'buttons' do
    it 'has a button to get back to the discover page', :vcr do
      click_button 'Discover Page'

      expect(current_path).to eq(user_discover_path(user))
    end

    it 'has a button to create a viewing party', :vcr do
      click_button 'Create Viewing Party for The Dark Knight'

      expect(current_path).to eq(new_user_movie_party_path(user, 155))
    end
  end

  describe 'movie information', :vcr do
    it 'has the movie title' do
      expect(page).to have_content("The Dark Knight")
    end

    it 'has the movie vote average' do
      expect(page).to have_content("Vote Average: 8.5")
    end

    it 'has the movie runtime' do
      expect(page).to have_content("Runtime: 152 minutes")
    end

    it 'has the movie genres' do
      expect(page).to have_content("Genre(s): Drama, Action, Crime, Thriller")
    end

    it 'has the movie summary discription' do
      summary = "Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker."

      expect(page).to have_content(summary)
    end

    it 'has the movies first ten cast members' do
      actor1 = "Christian Bale as Bruce Wayne / Batman"
      actor10 = 'Ron Dean as Michael Wuertz'

      expect(page).to have_content(actor1)
      expect(page).to have_content(actor10)
    end

    it 'has the movie reviews' do
      expect(page).to have_content("7 Reviews")
      expect(page).to have_content("Author: tricksy")
      expect(page).to have_content("Excellent movie. Best of the trilogy. Lovely music. Nolan is a genius. So is Heath Ledger.")

      expect(page).to have_content("Author: EDSR")
      expect(page).to have_content("A sickening, borderline fascist film that is simultaneously dull and harmful. The editing represents that of an anti-pirate commercial and the politics are beyond reprehensible. The film ends with a monologue about how violent law-enforcement and brutality is what the country needs, but does not deserve. Nolan clearly did not intend for any subtext, yet that is not an excuse, if anything, that makes it worse. He includes these scenes to make the film more dark and edgy, yet there are people, from suppressed countries, who have to live through the hardships of violence from law-enforcers and dictatorship every day, and in his obliviousness, Nolan thinks that using this in a superhero film is a good excuse for self-importance. He is a war profiteer, and exploiter, and this is nothing short of disgusting.")
    end
  end
end
