class Piece < ApplicationRecord
  validates_presence_of :title, :subtitle, :composer, :api_work_id

  has_many :tips
  has_many :favorite_pieces
end
