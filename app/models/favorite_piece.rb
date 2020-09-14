class FavoritePiece < ApplicationRecord
  belongs_to :user_id
  belongs_to :piece_id
end
