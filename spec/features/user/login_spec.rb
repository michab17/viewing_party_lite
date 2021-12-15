require 'rails_helper'

RSpec.describe "login page" do
  let!(:user) { User.create(name: 'user', email: 'email@email.com', password: 'password', password_confirmation: 'password') }
  
  it 'redirects the user to their dashboard if information is correct' do
    visit login_path

    fill_in :email, with: 'email@email.com'
    fill_in :password, with: 'password'
    click_button 'Login'

    expect(current_path).to eq(user_path(user))
  end
end