class TipsController < ApplicationController
  def new
    @piece = Piece.find_by({api_work_id:  params[:id]})
  end

  def create
    piece = Piece.find_by({api_work_id:  params[:id]})
    tip = Tip.create(tip: params[:tip], difficulty_rating: params[:difficulty_rating], user_id: current_user.id, piece_id: piece.id)
    if tip.save
      flash[:success] = "Your tip has been added to the piece"
      redirect_to "/pieces/#{params[:id]}"
    else
      flash[:error] = tip.errors.full_messages.to_sentence
      redirect_to "/pieces/#{params[:id]}/tips/new"
    end
  end
end
