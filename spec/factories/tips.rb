FactoryBot.define do
  factory :tip do
    difficulty_rating { 1 }
    tip { "MyText" }
    piece_id { nil }
    user_id { nil }
  end
end
