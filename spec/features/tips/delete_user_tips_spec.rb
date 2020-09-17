require 'rails_helper'

RSpec.describe "user tips deletion" do
  it "shows a link next to each tip to Delete Tip" do
    user = User.create!(username: "Peter Parker" ,uid: "12345678" ,access_token: "token" ,email: "peter@parker.com")
    data_response = stub_request(:get, "#{ENV['API_SINATRA_URL']}piece/28072").to_return(status: 200, body: File.read('spec/data/piece_data.json'))
    parsed_data = JSON.parse(data_response.response.body, symbolize_names: true)
    piece_id = parsed_data[:work][:id]
    piece = Piece.create!(id: piece_id, title: "Do Re Mi", subtitle: "C Scale", composer: "Sir Wigwearer", api_work_id: piece_id)

    visit root_path
    click_on "Log In"

    tip1 = Tip.create!(tip: "Something about classical music", difficulty_rating: 2, user: user, piece: piece)
    tip2 = Tip.create!(tip: "Something else about classical music", difficulty_rating: 3, user: user, piece: piece)
    tip3 = Tip.create!(tip: "Some more about classical music", difficulty_rating: 4, user: user, piece: piece)

    tips = [tip1, tip2, tip3]

    visit "/pieces/#{piece.id}"

    tips.each do |tip|
      within "#tips-#{tip.id}" do
        expect(page).to have_link("Delete Tip")
      end
    end
  end

  it "allows user to delete their tip from a piece" do
    user = User.create!(username: "Peter Parker" ,uid: "12345678" ,access_token: "token" ,email: "peter@parker.com")
    data_response = stub_request(:get, "#{ENV['API_SINATRA_URL']}piece/28072").to_return(status: 200, body: File.read('spec/data/piece_data.json'))
    parsed_data = JSON.parse(data_response.response.body, symbolize_names: true)
    piece_id = parsed_data[:work][:id]
    piece = Piece.create!(id: piece_id, title: "Do Re Mi", subtitle: "C Scale", composer: "Sir Wigwearer", api_work_id: piece_id)

    visit root_path
    click_on "Log In"

    tip1 = Tip.create!(tip: "Something about classical music", difficulty_rating: 2, user: user, piece: piece)
    tip2 = Tip.create!(tip: "Something else about classical music", difficulty_rating: 3, user: user, piece: piece)
    tip3 = Tip.create!(tip: "Some more about classical music", difficulty_rating: 4, user: user, piece: piece)

    tips = [tip1, tip2, tip3]

    visit "/pieces/#{piece.id}"

    within "#tips-#{tip1.id}" do
      click_on "Delete Tip"
    end

    expect(current_path).to eq("/pieces/#{piece.id}")
    expect(page).to_not have_css("#tips-#{tip1.id}")
  end
end
