require 'rails_helper'

RSpec.describe 'Welcome page' do
  it 'has a title and google link button' do
    visit root_path

    title = 'Practice Hacker'
    explanation = 'This is a classical music app'
    expect(page).to have_content(title)
    expect(page).to have_link('Login With Google')
    within '.welcome-main_content' do
      expect(page).to have_content(explanation)
    end
  end
end
