require 'spec_helper'

feature 'User Registration' do

  scenario 'register a new user' do
    visit root_path
    user = build(:user_registration)
    expect{
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Age', with: user.age
      #save_and_open_page
      click_button 'Create'
    }.to change(User, :count).by(1)
    expect(current_path).to eq root_path
  end

end
