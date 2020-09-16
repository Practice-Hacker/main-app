class Tip < ApplicationRecord
  validates_presence_of :difficulty_rating, :tip
  validates_inclusion_of :difficulty_rating, in: 1..5

  belongs_to :piece
  belongs_to :user
end
