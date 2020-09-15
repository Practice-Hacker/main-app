require 'rails_helper'

RSpec.describe "As an authenticated user" do
  it "can show the title, and composer of my favorite peices on my favorites index page" do
    user = User.create!(username:"Tony Stark" ,uid: "12345678" ,access_token: "token" ,email: "tony@stark.com")
    piece1 = FactoryBot.create(:piece)
    piece2 = FactoryBot.create(:piece)
    piece3 = FactoryBot.create(:piece)
    piece4 = FactoryBot.create(:piece)
    piece5 = FactoryBot.create(:piece)
    piece6 = FactoryBot.create(:piece)
    piece7 = FactoryBot.create(:piece)
    piece8 = FactoryBot.create(:piece)
    piece9 = FactoryBot.create(:piece)
    piece10 = FactoryBot.create(:piece)
    piece11 = FactoryBot.create(:piece)
    piece12 = FactoryBot.create(:piece)
    FavoritePiece.create!(user_id: user.id, piece_id: piece1.id)
    FavoritePiece.create!(user_id: user.id, piece_id: piece3.id)
    FavoritePiece.create!(user_id: user.id, piece_id: piece4.id)
    FavoritePiece.create!(user_id: user.id, piece_id: piece5.id)
    FavoritePiece.create!(user_id: user.id, piece_id: piece6.id)
    FavoritePiece.create!(user_id: user.id, piece_id: piece7.id)
    FavoritePiece.create!(user_id: user.id, piece_id: piece8.id)
    FavoritePiece.create!(user_id: user.id, piece_id: piece9.id)
    FavoritePiece.create!(user_id: user.id, piece_id: piece10.id)
    FavoritePiece.create!(user_id: user.id, piece_id: piece11.id)
    FavoritePiece.create!(user_id: user.id, piece_id: piece12.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # favorite_piece1 = FactoryBot.create(:favorite_piece, piece: piece1, user: user)
    # favorite_piece2 = FactoryBot.create(:favorite_piece, piece: piece3, user: user)


    visit(user_favorites_path)

    expect(page).to have_css(".title", count: 11)

    within('.pieces') do
      expect(page).to have_css('.title')
      expect(page).to have_css('.composer')
      expect(page).to have_css('.contributions')
      within(first('.title')) do
        expect(page).to have_link(piece1.title)
      end

      within(first('.composer')) do
        expect(page).to have_content(piece1.composer)
      end

      # within(first('.contributions')) do
      #   expect(page).to have_content(piece1.contributions)
      # end
    end

  end
end
# TODO: Add pagination to this page so that we get up to 10 pieces on one page
# and I should also see a “Next Page” button at the bottom of the page
# Number of contributions to this piece
