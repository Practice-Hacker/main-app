require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_presence_of :uid }
    it { should validate_presence_of :access_token }
    it { should validate_presence_of :email }
  end

  describe 'relationships' do
    it {should have_many :favorite_pieces}
    it {should have_many :tips}
  end
end
