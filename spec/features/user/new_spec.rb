require 'rails_helper'

RSpec.describe 'new user register page' do
  it 'has a form to create a new user' do
    visit register_path

    fill_in :name, with: 'user'
    fill_in :email, with: 'email@email.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'
    click_button 'Register'

    user = User.find_by email: 'email@email.com'
    
    expect(current_path).to eq(user_path(user))
  end

  it 'redirects back to the registration page if passwords dont match' do
    visit register_path

    fill_in :name, with: 'user'
    fill_in :email, with: 'email@email.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'p3'
    click_button 'Register'
    
    expect(current_path).to eq(register_path)
  end

  it 'redirects back to the registration page if email is not unique' do
    visit register_path

    fill_in :name, with: 'user'
    fill_in :email, with: 'email@email.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'
    click_button 'Register'
    
    user = User.find_by email: 'email@email.com'

    expect(current_path).to eq(user_path(user))

    visit register_path

    fill_in :name, with: 'user'
    fill_in :email, with: 'email@email.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'
    click_button 'Register'
    
    expect(current_path).to eq(register_path)
  end
end