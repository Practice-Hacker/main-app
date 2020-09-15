require 'rails_helper'

RSpec.describe "As an authenticated user" do
  it "can show the title, and composer of my favorite peices on my favorites index page" do
    user = User.create!(username:"Tony Stark" ,uid: "12345678" ,access_token: "token" ,email: "tony@stark.com")
    piece1 = FactoryBot.create(:piece)
    piece2 = FactoryBot.create(:piece)
    piece3 = FactoryBot.create(:piece)
    FavoritePiece.create!(user_id: user.id, piece_id: piece1.id)
    FavoritePiece.create!(user_id: user.id, piece_id: piece3.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # favorite_piece1 = FactoryBot.create(:favorite_piece, piece: piece1, user: user)
    # favorite_piece2 = FactoryBot.create(:favorite_piece, piece: piece3, user: user)


    visit(user_favorites_path)

    within('.pieces') do
      expect(page).to have_css('.titles')
      expect(page).to have_css('.composers')
      expect(page).to have_css('.contributions')
      within(first('.titles')) do
        expect(page).to have_content(piece1.title)
      end

      within(first('.composers')) do
        expect(page).to have_content(piece1.composer)
      end

      # within(first('.contributions')) do
      #   expect(page).to have_content(piece1.contributions)
      # end
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
