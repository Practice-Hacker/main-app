require 'rails_helper'

RSpec.describe "As a new user" do
  it "can log in using the Oauth" do
    visit root_path

    expect(page).to have_link('Register')

    click_link('Register')

    expect(current_path).to eq(user_new_path)

  end
end
