class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def edit; end

  def update
    @user.update(user_params)
    #redirect_to user_dashboard_path(@user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:username, :about_me)
  end
end
