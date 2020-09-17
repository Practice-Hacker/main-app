require 'rails_helper'

RSpec.describe "user tips updating" do
  before :each do
    @user = User.create!(username: "Bruce Banner" ,uid: "12345678" ,access_token: "token" ,email: "tony@stark.com")
    @piece = Piece.create!(title: "Do Re Mi", subtitle: "C Scale", composer: "Sir Wigwearer")
    visit root_path
    click_on "Log In"
  end

  it "shows a link next to each tip to Edit Tip"
    tip1 = Tip.create!(tip: "Something about classical music", difficulty_rating: 2, user: @user, piece: @piece)
    tip2 = Tip.create!(tip: "Something else about classical music", difficulty_rating: 3, user: @user, piece: @piece)
    tip3 = Tip.create!(tip: "Some more about classical music", difficulty_rating: 4, user: @user, piece: @piece)

    tips = [tip1, tip2, tip3]

    visit "/pieces/#{@piece.id}"

    tips.each do |tip|
      within "#tips-#{tip.id}" do
        expect(page).to have_link("Edit Tip")
      end
    end
  end
