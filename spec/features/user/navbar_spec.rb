require 'rails_helper'

RSpec.describe 'user navbar' do
  describe 'appears when appropriate' do
    before(:each) do
      visit '/'
      # MOCK USER NEEDS TO LOG IN HERE
    end

    it 'on Favorites page after a user is logged in' do
      click_button "Favorites"
      expect(page).to have_button("Search")
      expect(page).to have_button("Browse Music")
      expect(page).to have_button("Favorites")
      expect(page).to have_button("Profile")
      expect(page).to have_button("Home")
      expect(page).to have_button("Log Out")
    end

    it 'on Profile page after a user is logged in' do
      click_button "Profile"
      expect(page).to have_button("Search")
      expect(page).to have_button("Browse Music")
      expect(page).to have_button("Favorites")
      expect(page).to have_button("Profile")
      expect(page).to have_button("Home")
      expect(page).to have_button("Log Out")
    end

    it 'on Home page after a user is logged in' do
      click_button "Home"
      expect(page).to have_button("Search")
      expect(page).to have_button("Browse Music")
      expect(page).to have_button("Favorites")
      expect(page).to have_button("Profile")
      expect(page).to have_button("Home")
      expect(page).to have_button("Log Out")
    end

    it 'doesn't appear on Home page after a user logs out' do
      expect(page).to have_button("Search")
      expect(page).to have_button("Browse Music")
      expect(page).to_not have_button("Favorites")
      expect(page).to_not have_button("Profile")
      expect(page).to_not have_button("Home")
      expect(page).to_not have_button("Log Out")
    end
  end
end
