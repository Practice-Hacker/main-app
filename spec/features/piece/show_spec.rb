require 'rails_helper'

RSpec.describe "piece show page" do
  it "should have the name of the piece and composer (dummy data test)" do
    piece = Piece.create!(title: "Such a good title", subtitle: "no subtitle here", composer: "The bestest composer")
    visit piece_show_path(piece.id)
    expect(page).to have_content(piece.title)
    expect(page).to have_content(piece.composer)
  end

  it "should have the name of the piece and composer (api request test)" do
    data_response = stub_request(:get, "#{ENV['API_SINATRA_URL']}piece/28072").to_return(status: 200, body: File.read('spec/data/piece_data.json'))
    parsed_data = JSON.parse(data_response.response.body, symbolize_names: true)
    piece_id = parsed_data[:work][:id]
    visit piece_show_path(piece_id)
    expect(page).to have_content(parsed_data[:work][:title])
    expect(page).to have_content(parsed_data[:composer][:name])
  end
end
