require 'rails_helper'

RSpec.describe "user tips deletion" do
  it "shows a link next to each tip to Delete Tip" do
    user = User.create!(username: "Victor Shade" ,uid: "12345678" ,access_token: "token" ,email: "victor@shade.com")
    piece = Piece.create!(title: "Do Re Mi", subtitle: "C Scale", composer: "Sir Wigwearer")

    visit root_path
    click_on "Log In"

    tip1 = Tip.create!(tip: "Something about classical music", difficulty_rating: 2, user: user, piece: piece)
    tip2 = Tip.create!(tip: "Something else about classical music", difficulty_rating: 3, user: user, piece: piece)
    tip3 = Tip.create!(tip: "Some more about classical music", difficulty_rating: 4, user: user, piece: piece)

    tips = [tip1, tip2, tip3]

    visit "/pieces/#{piece.id}"

    tips.each do |tip|
      within "#tips-#{tip.id}" do
        expect(page).to have_link("Delete Tip")
      end
    end
  end

  it "allows user to delete their tip from a piece" do
    user = User.create!(username: "Victor Shade" ,uid: "12345678" ,access_token: "token" ,email: "victor@shade.com")
    piece = Piece.create!(title: "Do Re Mi", subtitle: "C Scale", composer: "Sir Wigwearer")

    visit root_path
    click_on "Log In"

    tip1 = Tip.create!(tip: "Something about classical music", difficulty_rating: 2, user: user, piece: piece)
    tip2 = Tip.create!(tip: "Something else about classical music", difficulty_rating: 3, user: user, piece: piece)
    tip3 = Tip.create!(tip: "Some more about classical music", difficulty_rating: 4, user: user, piece: piece)

    tips = [tip1, tip2, tip3]

    visit "/pieces/#{piece.id}"

    within "#tips-#{tip1.id}" do
      click_on "Delete Tip"
    end

    expect(current_path).to eq("/pieces/#{piece.id}")
    expect(page).to_not have_css("#tips-#{tip1.id}")
  end
end
