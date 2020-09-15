require 'rails_helper'

RSpec.describe "user tips CRUD functionality" do
  before :each do
    @user = User.create!(username:"Tony Stark" ,uid: "12345678" ,access_token: "token" ,email: "tony@stark.com")
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

end
