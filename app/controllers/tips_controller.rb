class TipsController < ApplicationController
  def new
    @piece = Piece.find(params[:id])
  end

  def create
    @piece = Piece.find(params[:id])
    tip = @piece.tips.create(tip_params)
    if tip.save
      flash[:success] = "Your tip has been added to the piece"
      redirect_to "/pieces/#{@piece.id}"
    else
      flash[:error] = tip.errors.full_messages.to_sentence
      redirect_to "/pieces/#{@piece.id}/tips/new"
    end
  end

  private

  def tip_params
    params.permit(:tip, :difficulty_rating)
  end
end
