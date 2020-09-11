require 'rails_helper'

RSpec.describe 'guest navbar' do
  it 'has search, browse, register, and log in' do
    visit root_path
    expect(page).to have_button("Browse Music")
    expect(page).to have_field("Search for Music")
    expect(page).to have_button("Log In")
    expect(page).to have_button("Register")
    expect(page).to_not have_button("Home")
    expect(page).to_not have_button("Profile")
    expect(page).to_not have_button("Favorites")
  end
end
