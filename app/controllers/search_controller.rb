class SearchController < ApplicationController
  def index
    @query = params[:q]
    @offset = params[:offset].to_i
    return redirect_to root_path if @query.empty?

    @pieces = SearchFacade.pieces(@query,  @offset)
  end
end
