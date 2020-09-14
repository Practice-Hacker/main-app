class SearchFacade
  def self.pieces(query)
    search_data(query)[:results].map do |result|
      Piece.new(result)
    end
  end

  def self.search_data(query)
    ApiCallService.new.parsed_search(query)
  end
end
