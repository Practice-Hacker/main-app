class User < ApplicationRecord

  def self.from_omniauth(auth)
    user = User.find_by(id: auth[:uid]) || User.new
    user.attributes = {
      username: auth[:info][:name],
      email: auth[:info][:email],
      access_token: auth[:credentials][:token]
    }
    user.save!
    user
  end
end
