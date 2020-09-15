require 'rails_helper'

RSpec.describe "authenticated user profile page" do
  before :each do
    # @user = create(:user)
    @user = User.create!(username:"Tony Stark" ,uid: "12345678" ,access_token: "token" ,email: "tony@stark.com")
    visit root_path
    click_on "Log In"
  end

  it "shows username with their selected roles" do
    visit "/users/#{@user.id}"
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).to have_content(@user.username)
    expect(page).to have_css(".user-roles")
    # check to see if this css is not empty if user has selected roles once roles functionality added
  end

  it "shows sections for About Me, My Skills and Pieces Contributed To" do
    visit "/users/#{@user.id}"
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).to have_css(".about-me")
    expect(page).to have_css(".my-skills")
    expect(page).to have_css(".pieces-contributed-to")
  end

  it "allows user to edit username" do
    visit "/users/#{@user.id}"
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).to have_content(@user.username)

    click_on "Edit Profile"

    fill_in :username, with: "Bruce Banner"
    click_on "Submit Changes"

    expect(page).to have_content("Bruce Banner")
    expect(page).to_not have_content("Tony Stark")
  end

  it "does not allow user to edit username to one that is already in use by another user" do
    user2 = User.create!(username: "StringsNThings" ,uid: "23456789" ,access_token: "token2" ,email: "strings@things.com")

    visit "/users/#{@user.id}"
    expect(current_path).to eq("/users/#{@user.id}")

    click_on "Edit Profile"

    fill_in :username, with: "StringsNThings"
    click_on "Submit Changes"

    expect(page).to have_content("Username has already been taken")
    expect(current_path).to eq("/users/#{@user.id}/edit")

    fill_in :username, with: "Bruce Banner"
    click_on "Submit Changes"

    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).to have_content("Bruce Banner")
    expect(page).to_not have_content("Tony Stark")
    expect(page).to_not have_content("StringsNThings")
  end
end
