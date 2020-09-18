require 'rails_helper'

RSpec.describe 'Welcome page' do
  it 'has a title and google link button' do
    visit root_path

    title = 'PracticeHacker'
    explanation = 'Hack your practice routine with Practice Hacker!'
    explanation2 = 'Search for the piece you are working on, and browse through user contributed tips for each piece.'
    explanation3 = 'Our users are able to share their experience and knowledge by offering advice on mastering parts they found difficult.'
    explanation4 = 'You can share anything from etudes to different fingerings to try.'
    explanation5 = 'What worked for you may just work for someone else!'
    expect(page).to have_content(title)
    expect(page).to have_link('Login With Google')
    within '.welcome-main_content' do
      expect(page).to have_content(explanation)
      expect(page).to have_content(explanation2)
      expect(page).to have_content(explanation3)
      expect(page).to have_content(explanation4)
      expect(page).to have_content(explanation5)
    end
  end
end
