require 'rails_helper'

RSpec.describe Tip, type: :model do
  describe 'validations' do
    it { should validate_presence_of :difficulty_rating }
    it { should validate_presence_of :tip }
    it { should validate_presence_of :piece_id }
    it { should validate_presence_of :user_id }
  end

  describe 'relationships' do
    it {should belong_to :piece}
    it {should belong_to :user}
  end
end
