require 'rails_helper'

RSpec.describe 'user navbar' do
  describe 'appears when appropriate' do
    before(:each) do
      @user = User.create!(username:"Tony Stark" ,uid: "12345678" ,access_token: "token" ,email: "tony@stark.com")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it 'on Favorites page after a user is logged in' do
      visit user_favorites_index_path
      expect(page).to have_button("Search")
      expect(page).to have_link("Browse Music")
      expect(page).to have_link("Favorites")
      expect(page).to have_link("Profile")
      expect(page).to have_link("Log Out")
    end

    it 'on Profile page after a user is logged in' do
      visit user_path(@user.id)
      expect(page).to have_button("Search")
      expect(page).to have_link("Browse Music")
      expect(page).to have_link("Favorites")
      expect(page).to have_link("Profile")
      expect(page).to have_link("Log Out")
    end

    it 'on Home page after a user is logged in' do
      visit "/"
      expect(page).to have_button("Search")
      expect(page).to have_link("Browse Music")
      expect(page).to have_link("Favorites")
      expect(page).to have_link("Profile")
      expect(page).to have_link("Log Out")
    end

    it "on the Piece Show page after a user is logged in" do
      piece = Piece.create!(title: "Such a good title", subtitle: "NOPE", composer: "The bestest composer", api_work_id: "60")
      visit piece_show_path(piece.api_work_id)

      expect(page).to have_button("Search")
      expect(page).to have_link("Browse Music")
      expect(page).to have_link("Favorites")
      expect(page).to have_link("Profile")
      expect(page).to have_link("Log Out")
    end

  end

  describe 'logout' do
    it "doesn't appear on Home page after a user logs out" do
      visit root_path
      click_on 'Log In'
      select 'Teacher', from: 'Role'
      click_on 'Submit Changes'
      click_link "Log Out"
      expect(page).to have_button("Search")
      expect(page).to have_link("Browse Music")
      expect(page).to_not have_link("Favorites")
      expect(page).to_not have_link("Profile")
      expect(page).to_not have_link("Log Out")
    end
  end
end
