class SearchController < ApplicationController
  def index
    @query = params[:q]
    @offset = params[:offset] || 0
    @pieces = SearchFacade.pieces(@query,  @offset)
  end
end
