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

  def destroy
    session[:return_to] ||= request.referer
    favorite = FavoritePiece.find_by(piece_id: params[:piece_id], user_id: params[:user_id])
    if favorite.nil?
      favorite = FavoritePiece.find_by(id: params[:id])
    end
    favorite.destroy
    flash[:success] = "This piece has been removed from your favorites."
    redirect_to session.delete(:return_to)
    # redirect_to piece_show_path(params[:id])
  end
end
