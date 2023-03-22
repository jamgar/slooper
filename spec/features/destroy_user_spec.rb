require 'rails_helper'

describe "Destroying a user", type: :feature do
  before do
    @user = User.create(first_name: 'Jon', last_name: 'Dee', email: 'jd@example.com', phone: '123-456-7890')
  end

  it "destroys a user" do
    visit users_path
    click_button 'Delete'
    expect(page).to have_content('User successfully deleted.')
  end
end
