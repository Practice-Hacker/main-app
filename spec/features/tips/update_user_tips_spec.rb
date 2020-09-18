require 'rails_helper'

RSpec.describe "user tips updating" do
  it "shows a link next to each tip to Edit Tip" do
    user = User.create!(username: "Peter Parker" ,uid: "12345678" ,access_token: "token" ,email: "peter@parker.com")
    data_response = stub_request(:get, "#{ENV['API_SINATRA_URL']}piece/28072").to_return(status: 200, body: File.read('spec/data/piece_data.json'))
    parsed_data = JSON.parse(data_response.response.body, symbolize_names: true)
    piece_id = parsed_data[:work][:id]
    piece = Piece.create!(title: "Do Re Mi", subtitle: "C Scale", composer: "Sir Wigwearer", api_work_id: "#{piece_id}")

    visit root_path
    click_on "Log In"

    tip1 = Tip.create!(tip: "Something about classical music", difficulty_rating: 2, user: user, piece: piece)
    tip2 = Tip.create!(tip: "Something else about classical music", difficulty_rating: 3, user: user, piece: piece)
    tip3 = Tip.create!(tip: "Some more about classical music", difficulty_rating: 4, user: user, piece: piece)

    tips = [tip1, tip2, tip3]

    visit "/pieces/#{piece_id}"

    tips.each do |tip|
      within "#tips-#{tip.id}" do
        expect(page).to have_link("Edit Tip")
      end
    end
  end

  it "allows user to update tip by editing all fields" do
    user = User.create!(username: "Peter Parker" ,uid: "12345678" ,access_token: "token" ,email: "peter@parker.com")
    data_response = stub_request(:get, "#{ENV['API_SINATRA_URL']}piece/28072").to_return(status: 200, body: File.read('spec/data/piece_data.json'))
    parsed_data = JSON.parse(data_response.response.body, symbolize_names: true)
    piece_id = parsed_data[:work][:id]
    piece = Piece.create!(id: piece_id, title: "Do Re Mi", subtitle: "C Scale", composer: "Sir Wigwearer", api_work_id: "#{piece_id}")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


    tip1 = Tip.create!(tip: "Something about classical music", difficulty_rating: 2, user: user, piece: piece)

    visit "/pieces/#{piece_id}"

    within "#tips-#{tip1.id}" do
      click_on "Edit Tip"
    end

    expect(current_path).to eq("/pieces/#{piece.id}/tips/#{tip1.id}/edit")
    expect(find_field(:tip).value).to eq(tip1.tip)

    fill_in :tip, with: "New tip about classical music"
    select 3, from: :difficulty_rating
    click_on "Update Tip"

    expect(current_path).to eq("/pieces/#{piece_id}")

    within "#tips-#{tip1.id}" do
      expect(page).to have_content("Tip Info: New tip about classical music")
      expect(page).to have_content("Difficulty Rating: 3/5")
    end
  end

  it "allows user to update tip without having to edit all fields" do
    user = User.create!(username: "Peter Parker" ,uid: "12345678" ,access_token: "token" ,email: "peter@parker.com")
    data_response = stub_request(:get, "#{ENV['API_SINATRA_URL']}piece/28072").to_return(status: 200, body: File.read('spec/data/piece_data.json'))
    parsed_data = JSON.parse(data_response.response.body, symbolize_names: true)
    piece_id = parsed_data[:work][:id]
    piece = Piece.create!(id: piece_id, title: "Do Re Mi", subtitle: "C Scale", composer: "Sir Wigwearer", api_work_id: "28072")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)



    tip1 = Tip.create!(tip: "Something about classical music", difficulty_rating: 2, user: user, piece: piece)

    visit "/pieces/#{piece_id}"

    within "#tips-#{tip1.id}" do
      click_on "Edit Tip"
    end

    expect(current_path).to eq("/pieces/#{piece.id}/tips/#{tip1.id}/edit")
    expect(find_field(:tip).value).to eq(tip1.tip)

    select 3, from: :difficulty_rating
    click_on "Update Tip"

    expect(current_path).to eq("/pieces/#{piece.id}")

    within "#tips-#{tip1.id}" do
      expect(page).to have_content("Tip Info: Something about classical music")
      expect(page).to have_content("Difficulty Rating: 3/5")
    end
  end
end
