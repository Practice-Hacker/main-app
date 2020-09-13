require 'rails_helper'

RSpec.describe "As a new user" do
  it "can log in using the Oauth" do
    visit root_path

    expect(page).to have_link('Register')

    click_link('Register')
    expect(current_path).to eq(edit_user_path(User.last.id))

    expect(page).to have_content('Edit your profile')

    expect(User.last.username).to eq("Tony Stark")
    expect(page).to have_field('Username')
    expect(page).to have_field('About me')
  end

  it "can edit a new user from the login" do
    visit root_path

    expect(page).to have_link('Register')

    click_link('Register')

    fill_in('Username', with: 'Bruce Banner')
    fill_in('About me', with: 'Hey all, I am trying to learn to play some classical tunes as a form of stress relief')
    click_on('Submit Changes')

    expect(User.last.username).to eq('Bruce Banner')
    expect(User.last.about_me).to eq('Hey all, I am trying to learn to play some classical tunes as a form of stress relief')
  end
end
