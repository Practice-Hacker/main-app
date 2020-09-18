require 'rails_helper'

RSpec.describe "as a user on my profile page" do
  it "I should see a section that contains the pieces I've contributed to and a number of how many contributions per piece" do
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
    total_tips = user.tips.size

    visit(user_path(user.id))

    within(".pieces-contributed-to") do
      within(".total-tips") do
        expect(page).to have_content("Overall number of tips contributed")
        expect(page).to have_content(total_tips)
      end
    end

    within("#contribution-#{piece1.id}") do
      expect(page).to have_link(piece1.title)
      expect(page).to have_content("Number of tips you've contributed to this piece: #{user.tips.where(piece_id: piece1.id).count}")
      expect(page).to have_content("Composed by: #{piece1.composer}")
      click_link(piece1.title)
    end
    expect(current_path).to eq("/pieces/#{piece1.api_work_id}")
  end
end
