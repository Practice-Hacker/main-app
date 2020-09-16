require 'rails_helper'

RSpec.describe 'guest navbar' do
  it 'has search, browse, register, and log in' do
    visit root_path
    expect(page).to have_link("Browse Music")
    expect(page).to have_field("q")
    expect(page).to have_link("Log In")
    expect(page).to have_link("Register")
    expect(page).to_not have_link("Home")
    expect(page).to_not have_link("Profile")
    expect(page).to_not have_link("Favorites")
  end

  it 'shows up on the piece show page' do
    piece = Piece.create!(title: "Such a good title", subtitle: "NOPE", composer: "The bestest composer")
    visit piece_show_path(piece.id)

    expect(page).to have_link("Browse Music")
    expect(page).to have_field("q")
    expect(page).to have_link("Log In")
    expect(page).to have_link("Register")
    expect(page).to_not have_link("Home")
    expect(page).to_not have_link("Profile")
    expect(page).to_not have_link("Favorites")
  end
end
