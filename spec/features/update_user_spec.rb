require 'rails_helper'

describe 'Update Users', type: :feature do
  before do
    @user = User.create(first_name: 'Jon', last_name: 'Dee', email: 'jd@example.com', phone: '123-456-7890')
  end

  context 'with valid data' do
    it 'updates a user' do
      visit users_path
      click_link 'Edit'

      fill_in 'First name', with: 'Jon'
      fill_in 'Last name', with: 'Doe'
      fill_in 'Email', with: 'jd@example.com'
      fill_in 'Phone', with: '123-456-7890'
      click_button 'Save'
      expect(page).to have_content('User successfully updated.')
    end
  end

  context 'with invalid data' do
    it 'gives error for blank First name' do
      visit users_path
      click_link 'Edit'

      fill_in 'First name', with: ''
      fill_in 'Last name', with: 'Doe'
      fill_in 'Email', with: 'jd@example.com'
      fill_in 'Phone', with: '123-456-7890'
      click_button 'Save'
      expect(page).to have_content("First name can't be blank")
    end

    it 'give error for invalid email' do
      visit users_path
      click_link 'Edit'

      fill_in 'First name', with: 'Jon'
      fill_in 'Last name', with: 'Dee'
      fill_in 'Email', with: 'jdexample.com'
      fill_in 'Phone', with: '123-456-7890'
      click_button 'Save'
      expect(page).to have_content("Email is not an email")
    end
  end
end
