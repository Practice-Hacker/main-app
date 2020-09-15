class TipsController < ApplicationController
  def new
    @piece = Piece.find(params[:id])
  end
end
