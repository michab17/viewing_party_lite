require 'rails_helper'

RSpec.describe 'User Dashboard', :vcr do
  let!(:user) { User.create!(name: 'Tom', email: 'user@email.com') }

  before do

    visit user_path(user)
  end
  it 'should have a title on the top of the page' do
    expect(page).to have_content("Tom's Dashboard")
  end

  it 'should have a button to discover movies' do
    click_button 'Discover Movies'

    expect(current_path).to eq(user_discover_path(user))
  end

  it 'should have a section to display Viewing Parties' do
    expect(page).to have_content('Viewing Parties')
  end

  it 'all viewing parties the user is associated with' do
    movie = Movie.new(movie_data) 
    party = Party.create!(host_id: user.id, movie_id: movie.id, date: "2021-12-12", time: "7:00:00") 
    userparty = UserParty.create!(user_id: user.id, party_id: party.id) 
  
    visit user_path(user)

    expect(page).to have_content('The Dark Knight')
    expect(page).to have_content("2021-12-12")
    expect(page).to have_content("7:00:00")
    expect(page).to have_content("Hosting")
  end
end