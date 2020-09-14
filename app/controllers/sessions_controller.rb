class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(access_token)
    session[:id] = user.id
    redirect_to edit_user_path(user.id)
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
