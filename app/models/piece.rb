class Piece < ApplicationRecord
  validates_presence_of :title, :subtitle, :composer

  has_many :tips
  has_many :favorite_pieces
end
