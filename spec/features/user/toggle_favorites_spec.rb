require 'rails_helper'

RSpec.describe "as a user on a piece show page" do
  it "I can favorite and unfavorite a piece" do
    user = User.create!(username:"Tony Stark" ,uid: "12345678" ,access_token: "token" ,email: "tony@stark.com")
    data_response = stub_request(:get, "#{ENV['API_SINATRA_URL']}piece/28072").to_return(status: 200, body: File.read('spec/data/piece_data.json'))
    parsed_data = JSON.parse(data_response.response.body, symbolize_names: true)
    piece_id = parsed_data[:work][:id]
    Piece.create!(title: "Such a good title", subtitle: "no subtitle here", composer: "The bestest composer", api_work_id: "#{piece_id}")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit piece_show_path(piece_id)
    save_and_open_page
    click_link "Favorite"
    expect(current_path).to eq("piece_show_path(piece_id)")
    expect(page).to have_link("Remove Favorite")
    click_link "Remove Favorite"
    expect(current_path).to eq("piece_show_path(piece_id)")
    expect(page).to have_link("Favorite")
  end
end

# Story:
# As an authenticated user,
# When I visit a piece’s show page,
# I should be able to toggle favorites on/off to add/remove them from my favorites,
# And I should see a flash message that the piece was successfully favorited/unfavorited,
# And depending on the status of the piece being a favorite already or not,
# the button text should say “Favorite” (if not favorited already) or “Unfavorite” (if favorited already).
