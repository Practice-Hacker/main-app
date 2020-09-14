require 'rails_helper'

RSpec.describe FavoritePiece, type: :model do
  describe 'validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :piece_id }
  end

  describe 'relationships' do
    it {should belong_to :user}
    it {should belong_to :piece}
  end
end
