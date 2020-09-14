class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def show
  end

  def edit; end

  def update
    @user.update(user_params)
    set_user.save!
    redirect_to user_path(set_user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:username, :about_me)
  end
end
