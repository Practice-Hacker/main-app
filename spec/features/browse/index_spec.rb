require 'rails_helper'

RSpec.describe "Browse" do
  it "takes you to a browse page with a choice of orchestral instruments" do
    visit browse_index_path
    expect(current_path).to eq("/browse")
    expect(page).to have_link("Violin")
    expect(page).to have_link("Viola")
    expect(page).to have_link("Cello")
    expect(page).to have_link("Bass")
    expect(page).to have_link("Flute")
    expect(page).to have_link("Piccolo")
    expect(page).to have_link("Oboe")
    expect(page).to have_link("Clarinet")
    expect(page).to have_link("Contrabassoon")
    expect(page).to have_link("Saxophone")
    expect(page).to have_link("Trumpet")
    expect(page).to have_link("Horn")
    expect(page).to have_link("Trombone")
    expect(page).to have_link("Tuba")
    expect(page).to have_link("Piano")
    expect(page).to have_link("Harpsichord")
    expect(page).to have_link("Organ")
    expect(page).to have_link("Harp")
    expect(page).to have_link("Timpani")
    expect(page).to have_link("Xylophone")
    expect(page).to have_link("Marimba")
    expect(page).to have_link("Vibraphone")
    expect(page).to have_link("Soprano")
    expect(page).to have_link("Mezzo-soprano")
    expect(page).to have_link("Alto")
    expect(page).to have_link("Countertenor")
    expect(page).to have_link("Tenor")
    expect(page).to have_link("Baritone")

  end

  it "let's you pick an instrument and then takes you to the search index page for that instrument" do
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
end
