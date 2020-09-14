require 'rails_helper'

RSpec.describe FavoritePiece, type: :model do
  describe 'relationships' do
    it {should belong_to :user}
    it {should belong_to :piece}
  end
end
