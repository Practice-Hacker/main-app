require 'rails_helper'

RSpec.describe 'Search Index' do
  before(:each) do
    # stub a logged in user
    user = User.create!({ username: 'Tony Stark', uid: '123456', access_token: 'token', email: 'test@test.com' })
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  end
  it 'should show piece information' do
    # Stub the request from the sinatra api
    data_response = stub_request(:get, "#{ENV['API_SINATRA_URL']}search?q=violin").to_return(status: 200, body: File.read('spec/data/search_data.json'))
    parsed_data = JSON.parse(data_response.response.body, symbolize_names: true)

    visit root_path

    within '.navbar' do
      fill_in :q, with: 'violin'
      click_button 'Search'
    end

    expect(current_path).to eq('/search')

    # TODO: Implement pagination in the test
    # It will ignore if the work is nil
    within 'section.pieces' do
      expect(page).to have_selector('.piece', count: 20)
    end

    within first('.piece') do
      expect(page).to have_content(parsed_data[:results][1][:composer][:name])
      expect(page).to have_content(parsed_data[:results][1][:work][:title])
    end
  end

  it 'should render something different if page had no results' do
    stub_request(:get, "#{ENV['API_SINATRA_URL']}search?q=qwerrewer").to_return(status: 200, body: File.read('spec/data/search_not_found.json'))

    visit root_path

    within '.navbar' do
      fill_in :q, with: 'qwerrewer'
      click_button 'Search'
    end

    expect(current_path).to eq('/search')

    expect(page).to have_content('We are sorry! We currently have no results for your query')
  end
end
