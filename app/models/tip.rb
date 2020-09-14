class Tip < ApplicationRecord
  validates_presence_of :difficulty_rating, :tip

  belongs_to :piece
  belongs_to :user
end
