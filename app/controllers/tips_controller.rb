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

  def edit
    @tip = Tip.find(params[:tip_id])
  end

  def update
    tip = Tip.find(params[:id])
    tip.update(tip_params)
    redirect_to "/pieces/#{tip.piece_id}"
  end

  private

  def tip_params
    params.permit(:tip, :difficulty_rating)
  end
end
