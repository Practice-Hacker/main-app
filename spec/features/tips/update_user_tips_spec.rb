require 'rails_helper'

RSpec.describe "user tips updating" do
  it "shows a link next to each tip to Edit Tip" do
    user = User.create!(username: "Peter Parker" ,uid: "12345678" ,access_token: "token" ,email: "peter@parker.com")
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
        expect(page).to have_link("Edit Tip")
      end
    end
  end

  it "allows user to update tip by editing all fields" do
    user = User.create!(username: "Peter Parker" ,uid: "12345678" ,access_token: "token" ,email: "peter@parker.com")
    piece = Piece.create!(title: "Do Re Mi", subtitle: "C Scale", composer: "Sir Wigwearer")

    visit root_path
    click_on "Log In"

    tip1 = Tip.create!(tip: "Something about classical music", difficulty_rating: 2, user: user, piece: piece)

    visit "/pieces/#{piece.id}"

    within "#tips-#{tip1.id}" do
      click_on "Edit Tip"
    end

    expect(current_path).to eq("/pieces/#{piece.id}/tips/#{tip1.id}/edit")
    expect(find_field(:tip).value).to eq(tip1.tip)

    fill_in :tip, with: "New tip about classical music"
    select 3, from: :difficulty_rating
    click_on "Update Tip"

    expect(current_path).to eq("/pieces/#{piece.id}")

    within "#tips-#{tip1.id}" do
      expect(page).to have_content("Tip Info: New tip about classical music")
      expect(page).to have_content("Difficulty Rating: 3/5")
    end
  end

  it "allows user to update tip without having to edit all fields" do
    user = User.create!(username: "Peter Parker" ,uid: "12345678" ,access_token: "token" ,email: "peter@parker.com")
    piece = Piece.create!(title: "Do Re Mi", subtitle: "C Scale", composer: "Sir Wigwearer")

    visit root_path
    click_on "Log In"

    tip1 = Tip.create!(tip: "Something about classical music", difficulty_rating: 2, user: user, piece: piece)

    visit "/pieces/#{piece.id}"

    within "#tips-#{tip1.id}" do
      click_on "Edit Tip"
    end

    expect(current_path).to eq("/pieces/#{piece.id}/tips/#{tip1.id}/edit")
    expect(find_field(:tip).value).to eq(tip1.tip)

    select 3, from: :difficulty_rating
    click_on "Update Tip"

    expect(current_path).to eq("/pieces/#{piece.id}")

    within "#tips-#{tip1.id}" do
      expect(page).to have_content("Tip Info: Something about classical music")
      expect(page).to have_content("Difficulty Rating: 3/5")
    end
  end
end
