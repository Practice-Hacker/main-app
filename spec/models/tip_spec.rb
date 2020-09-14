require 'rails_helper'

RSpec.describe Tip, type: :model do
  describe 'validations' do
    it { should validate_presence_of :difficulty_rating }
    it { should validate_presence_of :tip }
  end

  describe 'relationships' do
    it {should belong_to :piece}
    it {should belong_to :user}
  end
end
