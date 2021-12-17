require 'rails_helper'

RSpec.describe "login page" do
  let!(:user) { User.create(name: 'user', email: 'email@email.com', password: 'password', password_confirmation: 'password') }
  
  it 'redirects the user to their dashboard if information is correct' do
    visit login_path

    fill_in :email, with: 'email@email.com'
    fill_in :password, with: 'password'
    click_button 'Login'

    expect(current_path).to eq(dashboard_path)
  end

  it 'logs a user out when button is clicked' do
    visit login_path

    fill_in :email, with: 'email@email.com'
    fill_in :password, with: 'password'
    click_button 'Login'

    visit root_path

    click_button 'Logout'

    expect(page).to have_button("Login")
  end
end