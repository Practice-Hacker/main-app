require 'rails_helper'

RSpec.describe "piece show page" do
  it "should have the name of the piece and composer (dummy data test)" do
    piece = Piece.create!(title: "Such a good title", subtitle: "no subtitle here", composer: "The bestest composer")
    visit piece_show_path(piece.id)
    expect(page).to have_content(piece.title)
    expect(page).to have_content(piece.composer)
  end
end
