require 'rails_helper'

RSpec.describe "as a user on my favorites index page" do
  it "each piece title should be a link, and each piece should have the composer of that piece and the total number of contributions to that piece" do
    user = User.create!(username:"Super Student" ,uid: "12345678" ,access_token: "token" ,email: "violinioso@musician.net")
    piece1 = Piece.create!(title: "Such a good title", subtitle: "no subtitle here", composer: "The bestest composer", api_work_id: "3513")
    piece2 = Piece.create!(title: "So edgy", subtitle: "a study in new music", composer: "Creative Artist Type", api_work_id: "4124")
    piece3 = Piece.create!(title: "Violin Stuff", subtitle: "E string only", composer: "Old Dead White Guy", api_work_id: "9385")
    fav1 = FavoritePiece.create!(user_id: user.id, piece_id: piece1.id)
    fav2 = FavoritePiece.create!(user_id: user.id, piece_id: piece2.id)
    fav3 =FavoritePiece.create!(user_id: user.id, piece_id: piece3.id)
    Tip.create!(difficulty_rating: 5, tip: "Remember to play in tune here, it's so hard XD", piece_id: piece1.id, user_id: user.id)
    Tip.create!(difficulty_rating: 5, tip: "The best fingering for measures 4-100 is to only use your 4th finger. You're welcome.", piece_id: piece1.id, user_id: user.id)
    Tip.create!(difficulty_rating: 2, tip: "New music is just noise anyway, so in mm15-16 play really loud.", piece_id: piece2.id, user_id: user.id)
    Tip.create!(difficulty_rating: 3, tip: "Wow, I tried using only trem here and it sounds awesome", piece_id: piece2.id, user_id: user.id)
    Tip.create!(difficulty_rating: 1, tip: "don't forget to tune you a string up a half step in the rests from 88-100", piece_id: piece2.id, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit(user_favorites_path)

    within("#piece-#{fav1.id}") do
      expect(page).to have_content("Such a good title : no subtitle here")
      expect(page).to have_content("Composed by: The bestest composer")
      expect(page).to have_content("Number of tips you've contributed: 2")
    end

    within("#piece-#{fav2.id}") do
      expect(page).to have_content("So edgy : a study in new music")
      expect(page).to have_content("Creative Artist Type")
      expect(page).to have_content("Number of tips you've contributed: 3")
    end

    within("#piece-#{fav3.id}") do
      expect(page).to have_content("Violin Stuff : E string only")
      expect(page).to have_content("Old Dead White Guy")
      expect(page).to have_content("Number of tips you've contributed: 0")
    end
  end
end
