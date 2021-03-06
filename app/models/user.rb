class User < ApplicationRecord
  validates :username, uniqueness: true
  validates_presence_of :uid, :access_token, :email

  has_many :tips
  has_many :tipped_pieces, class_name: "Piece", through: :tips, source: :piece
  has_many :skills
  has_many :favorite_pieces
  has_many :pieces, through: :favorite_pieces

  def self.from_omniauth(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
      email: auth[:info][:email],
      access_token: auth[:credentials][:token],
      uid: auth[:uid]
    }
    user.save!
    user
  end
end
