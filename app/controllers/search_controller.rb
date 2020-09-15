class SearchController < ApplicationController
  def index
    @pieces = SearchFacade.pieces(params[:q])
  end
end
