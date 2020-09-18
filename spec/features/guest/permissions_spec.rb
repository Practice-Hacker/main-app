require 'rails_helper'

RSpec.describe "as a guest on the website" do
  it "I can use the search function" do
    data_response = stub_request(:get, "#{ENV['API_SINATRA_URL']}search?offset=0&q=violin").to_return(status: 200, body: File.read('spec/data/search_data.json'))
    parsed_data = JSON.parse(data_response.response.body, symbolize_names: true)

    visit root_path

    within '.navbar' do
      fill_in :q, with: 'violin'
      click_button 'Search'
    end

    expect(current_path).to eq('/search')

    within first('.piece') do
      expect(page).to have_content(parsed_data[:results][1][:composer][:name])
      expect(page).to have_content(parsed_data[:results][1][:work][:title])
    end
  end

  it "I can use the browse function" do
    data_response = stub_request(:get, "#{ENV['API_SINATRA_URL']}search?offset=0&q=Violin").to_return(status: 200, body: File.read('spec/data/search_data.json'))
    parsed_data = JSON.parse(data_response.response.body, symbolize_names: true)

    visit browse_index_path
    click_link("Violin")
    expect(current_path).to eq("/search")

    within('section.pieces') do
      expect(page).to have_selector('.piece', count: 20)
    end

    within first('.piece') do
      expect(page).to have_content(parsed_data[:results][1][:composer][:name])
      expect(page).to have_content(parsed_data[:results][1][:work][:title])
    end
  end

  it "on a piece show page I do not see an option to favorite the piece or add a tip" do
    piece = Piece.create!(title: "Such a good title", subtitle: "no subtitle here", composer: "The bestest composer", api_work_id: "150")
    visit piece_show_path(piece.api_work_id)
    expect(page).to_not have_content("Add Tip")
    expect(page).to_not have_content("Favorite")
    expect(page).to_not have_content("Remove Favorite")
  end
end
