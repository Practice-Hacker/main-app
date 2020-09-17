class UserFavoritesController < ApplicationController
  def create
    favorite = FavoritePiece.new
    show_id = params[:api_work_id]
    favorite.user_id = params[:user_id]
    favorite.piece_id = params[:piece_id]
    if favorite.save!
      flash[:success] = "This piece has been added to your favorites."
      redirect_to piece_show_path(show_id)
    end
  end

  def index
  end

  def delete
    flash[:success] = "This piece has been removed from your favorites."
  end
end
#
# def create
#   friend = User.find_by(email: params[:email_id])
#   if friend
#     current_user.add_friend(friend)
#     flash[:notice] = "#{friend.first_name} has been added as your friend"
#   else
#     flash[:alert] = 'There is no user with that email address'
#   end
#   redirect_to root_path
# end
