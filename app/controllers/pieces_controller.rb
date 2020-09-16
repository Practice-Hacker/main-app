class PiecesController < ApplicationController
  def show
    require 'pry'; binding.pry
    @piece = Piece.find_by({api_work_id:  params[:id]})
    if @piece.nil?
      
    # this needs to check if the piece is in our database
    # if it isn't it needs to get the info from our sinatra api?
    # make that info into a piece object to send to the view
  end
end
