require 'rails_helper'

RSpec.describe "authenticated user profile page" do
  before :each do
    @user = create(:user)
  end

  it "shows username with their selected roles" do
    visit "/profile/#{@user.id}"
    expect(current_path).to eq("/profile/#{@user.id}")
    expect(page).to have_content(@user.username)
    expect(page).to have_css(".user-roles")
    # check to see if this css is not empty if user has selected roles once roles functionality added
  end

  xit "shows sections for About Me, My Skills and Pieces Contributed To" do
    visit "/profile/#{@user.id}"
    expect(current_path).to eq("/profile")
    expect(page).to have_css(".about-me")
    expect(page).to have_css(".my-skills")
    expect(page).to have_css(".pieces-contributed-to")
  end

  xit "allows user to edit username" do
    visit "/profile/#{@user.id}"
    expect(current_path).to eq("/profile")
    expect(page).to have_content(@user.username)

    click_on "Edit Profile"

    fill_in :username, with: "BoomBoomClap123"
    click_on "Submit Changes"

    expect(page).to have_content("BoomBoomClap123")
    expect(page).to_not have_content()
  end

  xit "does not allow user to edit username to one that is already in use by another user" do
    user2 = User.create(username: "StringsNThings")

    visit "/profile/#{@user.id}"
    expect(current_path).to eq("/profile")


  end
end
