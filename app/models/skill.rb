class Skill < ApplicationRecord
  belongs_to :user
  # Adds a skill reference for use in displaying a users' skills on thier profile page
end
