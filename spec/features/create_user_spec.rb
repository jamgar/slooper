require 'rails_helper'

describe 'Create Users', type: :feature do
  before do
    visit new_user_path
  end

  context 'with valid data' do
    it 'creates a user' do
      visit users_path
      click_link 'New User'

      fill_in 'First name', with: 'Jon'
      fill_in 'Last name', with: 'Dee'
      fill_in 'Email', with: 'jd@example.com'
      fill_in 'Phone', with: '123-456-7890'
      click_button 'Save'
      expect(page).to have_content('User successfully created.')
    end
  end

  context 'with invalid data' do
    it 'gives error for blank First name' do
      visit users_path
      click_link 'New User'

      fill_in 'First name', with: ''
      fill_in 'Last name', with: 'Dee'
      fill_in 'Email', with: 'jd@example.com'
      fill_in 'Phone', with: '123-456-7890'
      click_button 'Save'
      expect(page).to have_content("First name can't be blank")
    end

    it 'give error for invalid email' do
      visit users_path
      click_link 'New User'

      fill_in 'First name', with: 'Jon'
      fill_in 'Last name', with: 'Dee'
      fill_in 'Email', with: 'jdexample.com'
      fill_in 'Phone', with: '123-456-7890'
      click_button 'Save'
      expect(page).to have_content("Email is not an email")
    end
  end
end
