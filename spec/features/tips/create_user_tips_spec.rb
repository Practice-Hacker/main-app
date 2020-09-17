require 'rails_helper'

RSpec.describe "user tips creation" do
  before :each do
    @user = User.create!(username: "Bruce Banner" ,uid: "12345678" ,access_token: "token" ,email: "tony@stark.com")
    @piece = Piece.create!(title: "Do Re Mi", subtitle: "C Scale", composer: "Sir Wigwearer")
    visit root_path
    click_on "Log In"
  end

  describe "when a user visits a piece show page" do
    it "displays a link for the user to add a tip to the piece" do
      visit "/pieces/#{@piece.id}"

      expect(page).to have_link("Add Tip")

      click_on "Add Tip"

      expect(current_path).to eq("/pieces/#{@piece.id}/tips/new")
    end
  end

  describe "when a user clicks the link to add a tip to a piece" do
    it "allows user to create a new tip" do
      visit "/pieces/#{@piece.id}"

      click_on "Add Tip"

      fill_in :tip, with: "Do the thing, yeah!"
      select 3, from: :difficulty_rating
      click_on "Create Tip"

      user_tip = Tip.last

      expect(current_path).to eq("/pieces/#{@piece.id}")
      expect(user_tip.tip).to eq("Do the thing, yeah!")
      expect(user_tip.difficulty_rating).to eq(3)

      within "#tips-#{user_tip.id}" do
        expect(page).to have_content("Tip Info: Do the thing, yeah!")
        expect(page).to have_content("Difficulty Rating: 3/5")
      end
    end
  end
end
