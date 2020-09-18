class SearchController < ApplicationController
  def index
    @query = params[:q]
    @pieces = SearchFacade.pieces(params[:q])
  end
end
