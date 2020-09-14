require 'rails_helper'

RSpec.describe "authenticated user profile page" do
  # before :each do
  #
  # end
  it "shows username with their selected roles" do
    user = User.create(username: "musiclover")
    expect(current_path).to eq("/profile")
    expect(page).to have_content("")
  end

  it "shows sections for About Me, My Skills and Pieces Contributed To" do
    
  end

  it "allows user to edit username" do

  end

  it "does not allow user to edit username to one that is already in use by another user" do

  end

  it "allows user to edit About Me and My Skills sections" do

  end

end
