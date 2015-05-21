require 'rails_helper'

RSpec.describe 'user' do
  context 'with an active account' do
    it 'can login' do
      User.create(first_name: "Steve",
                  last_name: "Jones",
                  username: "sjones",
                  email: "s@jones.com",
                  password: "password",
                  password_confirmation: "password")
      visit root_path
      click_link "Login"
      fill_in "session[email]", with: "s@jones.com"
      fill_in "session[password]", with: "password"
      click_button "Login"
      expect(page).to have_content("Steve")
    end
  end
end
