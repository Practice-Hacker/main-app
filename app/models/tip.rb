class Tip < ApplicationRecord
  belongs_to :piece_id
  belongs_to :user_id
end
