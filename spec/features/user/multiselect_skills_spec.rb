require 'rails_helper'

RSpec.describe "authenticated user profile edit page" do
  before :each do
    @user = User.create!(username:"Tony Stark" ,uid: "12345678" ,access_token: "token" ,email: "tony@stark.com")
    visit root_path
    click_on "Log In"
  end

  it "can select skills from a multiselect field" do
    click_on "Edit Profile"

    expect(page).to have_content('Skills')

    select 'Chamber', from: 'Skills'
    select 'Student', from: 'Role'

    click_button 'Submit Changes'

    expect(current_path).to eq(user_path(@user.id))
    
    within('.my-skills') do
      expect(page).to have_content('Chamber')
    end
  end
end

# As an authenticated user,
# When I visit my profile and click on "Edit Profile",
# I should be able to select skills from a multi select field and add them to my profile,
# And when I click on "Submit Changes on the edit profile page,
# I should be redirected to my user profile show page and I should see the skills I selected under the "My Skills" section.
