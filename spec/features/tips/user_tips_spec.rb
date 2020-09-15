require 'rails_helper'

RSpec.describe "user tips CRUD functionality" do
  before :each do
    @user = User.create!(username:"Tony Stark" ,uid: "12345678" ,access_token: "token" ,email: "tony@stark.com")
    @piece = Piece.create!(title: "Do Re Mi", subtitle: "", composer: "Sir Wigwearer")
    visit root_path
    click_on "Log In"
  end

  it "allows user to create a tip for a piece" do
    
  end
end
