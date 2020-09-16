class UsersController < ApplicationController
  before_action :user, only: [:show, :edit, :update, :destroy]
  def show
  end

  def edit; end

  def update
    if @user.update(user_params)
      user.save!
      redirect_to user_path(user.id)
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to edit_user_path(user.id)
    end
  end

  private

  def user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:username, :about_me)
  end
end
