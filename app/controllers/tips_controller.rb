class TipsController < ApplicationController
  def new
    @piece = Piece.find(params[:id])
  end

  def create
    tip = Tip.create(tip: params[:tip], difficulty_rating: params[:difficulty_rating], user_id: current_user.id, piece_id: params[:id])
    if tip.save
      flash[:success] = "Your tip has been added to the piece"
      redirect_to "/pieces/#{params[:id]}"
    else
      flash[:error] = tip.errors.full_messages.to_sentence
      redirect_to "/pieces/#{params[:id]}/tips/new"
    end
  end
end
