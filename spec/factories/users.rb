require 'faker'

FactoryBot.define do
  factory :user do
    # provider { :google }
    username { Faker::Name.first_name.downcase }
    uid { Faker::Number.within(range: 100000..999999) }
    access_token { Faker::Alphanumeric.alphanumeric(number: 20) }
    sequence :email do |n|
      "test#{:username}@test.com"
    end
  end
end
