require 'rails_helper'

RSpec.describe "as a user on my favorites page" do
  it "I can remove a favorite" do
    user = User.create!(username:"Tony Stark" ,uid: "12345678" ,access_token: "token" ,email: "tony@stark.com")
    data_response = stub_request(:get, "#{ENV['API_SINATRA_URL']}piece/28072").to_return(status: 200, body: File.read('spec/data/piece_data.json'))
    parsed_data = JSON.parse(data_response.response.body, symbolize_names: true)
    piece_id = parsed_data[:work][:id]
    piece = Piece.create!(title: "Such a good title", subtitle: "no subtitle here", composer: "The bestest composer", api_work_id: "#{piece_id}")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    favorite = FavoritePiece.create!(user_id: user.id, piece_id: piece.id)

    visit(user_favorites_path)

    within("#piece-#{favorite.id}") do
      expect(page).to have_link("Remove from Favorites")
      click_link("Remove from Favorites")
    end

    user.reload
    
    visit(user_favorites_path)
    expect(page).to_not have_content(piece.title)
  end
end
