require 'rails_helper'

RSpec.describe "piece show page" do
  it "should have the name of the piece and composer (dummy data test)" do
    piece = Piece.create!(title: "Such a good title", subtitle: "no subtitle here", composer: "The bestest composer")
    visit piece_show_path(piece.id)
    expect(page).to have_content(piece.title)
    expect(page).to have_content(piece.composer)
  end

  it "should have the name of the piece and composer (api request test)" do
    data_response = stub_request(:get, "#{ENV['API_SINATRA_URL']}search?q=violin").to_return(status: 200, body: File.read('spec/data/search_data.json'))
    parsed_data = JSON.parse(data_response.response.body, symbolize_names: true)
    expected_piece = parsed_data[:results].first

    visit root_path

    within 'navbar' do
      fill_in :q, with: 'violin'
      click_button 'Search'
    end

    find('.piece:first a').click
    expect(current_path).to eq("/pieces/#{expected_piece[:work][:id]}")
    # click the first piece
    # which should check if that piece is already in our database
    # for this test it should not be in our db
    # and it should create a row in our Piece table (we probably need to add a column for openopus id)
    # and display that info in the show page
  end
end

# make piece titles into links to show page from search index
