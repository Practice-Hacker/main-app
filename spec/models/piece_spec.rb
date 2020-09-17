require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :composer }
    it { should_not validate_presence_of :subtitle }
  end

  describe 'relationships' do
    it {should have_many :favorite_pieces}
    it {should have_many :tips}
  end
end
