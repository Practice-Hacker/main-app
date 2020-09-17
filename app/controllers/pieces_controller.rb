class PiecesController < ApplicationController
  def show
    @piece = Piece.find_by({api_work_id:  params[:id]})
    if @piece.nil?
      facade = PieceFacade.new(params[:id])
      @piece = facade.to_piece
      @piece.save!
    end
  end
end
