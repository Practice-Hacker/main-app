require 'rails_helper'

RSpec.describe "piece show page" do
  it "should have the name of the piece and composer" do
    piece = Piece.create(title: "Such a good title", composer: "The bestest composer")
    visit "/piece/#{piece.id}"
    expect(page).to have_content(piece.title)
    expect(page).to have_content(piece.composer)
  end
end
