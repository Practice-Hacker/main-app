require 'rails_helper'

RSpec.describe 'guest navbar' do
  it 'has search, browse, register, and log in' do
    visit root_path
    expect(page).to have_link("Browse Music")
    expect(page).to have_field("Search for Music")
    expect(page).to have_link("Log In")
    expect(page).to have_link("Register")
    expect(page).to_not have_link("Home")
    expect(page).to_not have_link("Profile")
    expect(page).to_not have_link("Favorites")
  end

  it 'shows up on the piece show page' do
    data_response = stub_request(:get, "#{ENV['API_SINATRA_URL']}piece/28072").to_return(status: 200, body: File.read('spec/data/piece_data.json'))
    parsed_data = JSON.parse(data_response.response.body, symbolize_names: true)
    piece_id = parsed_data[:work][:id]

    visit piece_show_path(piece_id)

    expect(page).to have_link("Browse Music")
    expect(page).to have_field("Search for Music")
    expect(page).to have_link("Log In")
    expect(page).to have_link("Register")
    expect(page).to_not have_link("Home")
    expect(page).to_not have_link("Profile")
    expect(page).to_not have_link("Favorites")
  end
end
