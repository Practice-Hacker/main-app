require 'rails_helper'

RSpec.describe "As an authenticated user" do
  it "can show the title, and composer of my favorite peices on my favorites index page" do
    user = User.create!(username:"Tony Stark" ,uid: "12345678" ,access_token: "token" ,email: "tony@stark.com")

    visit root_path

    click_on('Log In')

    click_on('Favorites')

    expect(current_path).to eq(user_favorites_path)

    within(first('.pieces')) do
      expect(page).to have_css('.titles')
      expect(page).to have_css('.composers')
      expect(page).to have_css('.contributions')
    end
  end
end

# Story:
# As an authenticated user,
# When I visit my favorites index page,
# I should be able to see sections that include:
#
# Title of piece, which each title is a link to the piece’s show page
# Composer of piece
# Number of contributions to this piece
# and I should also see a “Next Page” button at the bottom of the page
