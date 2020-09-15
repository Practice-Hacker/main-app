require 'rails_helper'

RSpec.describe 'user navbar' do
  describe 'appears when appropriate' do
    before(:each) do
      visit '/'
      click_on 'Login With Google'
      click_on 'Submit Changes'
    end

    it 'on Favorites page after a user is logged in' do
      click_link "Favorites"
      expect(page).to have_button("Search")
      expect(page).to have_link("Browse Music")
      expect(page).to have_link("Favorites")
      expect(page).to have_link("Profile")
      expect(page).to have_link("Home")
      expect(page).to have_link("Log Out")
    end

    it 'on Profile page after a user is logged in' do
      click_link "Profile"
      expect(page).to have_button("Search")
      expect(page).to have_link("Browse Music")
      expect(page).to have_link("Favorites")
      expect(page).to have_link("Profile")
      expect(page).to have_link("Home")
      expect(page).to have_link("Log Out")
    end

    it 'on Home page after a user is logged in' do
      click_link "Home"
      expect(page).to have_button("Search")
      expect(page).to have_link("Browse Music")
      expect(page).to have_link("Favorites")
      expect(page).to have_link("Profile")
      expect(page).to have_link("Home")
      expect(page).to have_link("Log Out")
    end

    it "on the Piece Show page after a user is logged in" do
      piece = Piece.create!(title: "Such a good title", subtitle: "NOPE", composer: "The bestest composer")
      visit piece_show_path(piece.id)

      expect(page).to have_button("Search")
      expect(page).to have_link("Browse Music")
      expect(page).to have_link("Favorites")
      expect(page).to have_link("Profile")
      expect(page).to have_link("Home")
      expect(page).to have_link("Log Out")
    end


    it "doesn't appear on Home page after a user logs out" do
      click_link "Log Out"
      expect(page).to have_button("Search")
      expect(page).to have_link("Browse Music")
      expect(page).to_not have_link("Favorites")
      expect(page).to_not have_link("Profile")
      expect(page).to_not have_link("Home")
      expect(page).to_not have_link("Log Out")
    end
  end
end
