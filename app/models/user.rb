class User < ApplicationRecord
  validates_presence_of :uid, :access_token, :email

  has_many :tips
  has_many :favorite_pieces

  def self.from_omniauth(auth)

    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
      email: auth[:info][:email],
      access_token: auth[:credentials][:access_token],
      uid: auth[:uid]
    }
    user.save!
    user
  end
end
