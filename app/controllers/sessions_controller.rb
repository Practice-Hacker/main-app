class SessionsController < ApplicationController
  def create
    # require "pry"; binding.pry
    user = User.from_omniauth(access_token)
    session[:id] = user.id
    if user.username.nil?
      redirect_to edit_user_path(user.id)
    else
      redirect_to user_path(user.id)
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  private

  def access_token
    request.env['omniauth.auth']
  end
end
