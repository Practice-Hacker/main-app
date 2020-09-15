class PiecesController < ApplicationController
  def show
    @piece = Piece.find(params[:id])
    # this needs to check if the piece is in our database
    # if it isn't it needs to get the info from our sinatra api?
    # make that info into a piece object to send to the view
  end
end
