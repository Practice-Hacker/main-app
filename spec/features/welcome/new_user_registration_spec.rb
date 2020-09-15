require 'rails_helper'

RSpec.describe "As a new user" do
  it "can log in using the Oauth" do
    visit root_path

    expect(page).to have_link('Login With Google')

    click_link('Login With Google')
    expect(current_path).to eq(edit_user_path(User.last.id))

    expect(page).to have_content('Edit your profile')

    expect(page).to have_field('Username')
    expect(page).to have_field('About me')
    expect(page).to have_content('Role')
  end

  # it "can edit a new user from the login" do
  #   visit root_path
  #
  #   expect(page).to have_link('Login With Google')
  #
  #   click_link('Login With Google')
  #
  #   fill_in('Username', with: 'Bruce Banner')
  #   fill_in('About me', with: 'Hey all, I am trying to learn to play some classical tunes as a form of stress relief')
  #   select 'Student', from: :role
  #   click_on('Submit Changes')
  #
  #   expect(User.last.username).to eq('Bruce Banner')
  #   expect(User.last.about_me).to eq('Hey all, I am trying to learn to play some classical tunes as a form of stress relief')
  #   expect(User.last.role).to eq('Student')
  # end

  it "can login an existing user to their profile" do
    User.create!(username:"Tony Stark" ,uid: "12345678" ,access_token: "token" ,email: "tony@stark.com")

    visit root_path

    click_on('Log In')

    expect(current_path).to eq(user_path(User.find_by(username: "Tony Stark").id))

    click_on('Log Out')

    click_on('Log In')
    expect(current_path).to eq(user_path(User.find_by(username: "Tony Stark").id))
  end

  it "can edit a role" do
    user = User.create!(username:"Tony Stark" ,uid: "12345678" ,access_token: "token" ,email: "tony@stark.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_user_path(user.id)

    expect(page).to have_content('Role')
    #   As an authenticated user,
    # When I visit my profile and click on "Edit Profile",
    # I should be able to select roles (Student, Teacher, Performer) from a multi select field and add them to my profile,
    # And when I click on "Submit Changes on the edit profile page,
    # I should be redirected to my user profile show page and I should see the roles I selected with my username on the page.
  end
end
