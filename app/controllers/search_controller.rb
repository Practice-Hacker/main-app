class SearchController < ApplicationController
  def index
    @query = params[:q]
    @offset = params[:offset].to_i 
    @pieces = SearchFacade.pieces(@query,  @offset)
  end
end
