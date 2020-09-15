class UsersController < ApplicationController
  before_action :user, only: [:show, :edit, :update, :destroy]
  def show
  end

  def edit; end

  def update
    @user.update(user_params)
    user.save!
    redirect_to user_path(user.id)
  end

  private

  def user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:username, :about_me)
  end
end
