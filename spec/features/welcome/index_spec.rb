require 'rails_helper'

RSpec.describe 'Welcome page' do
  it 'has a title and google link button' do
    visit root_path

    title = 'Practice Hacker'
    expect(page).to have_content(title)
    expect(page).to have_link('Login With Google')
  end
end
