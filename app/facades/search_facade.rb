class SearchFacade
  def self.pieces(query)
    return [] if search_data(query)[:results].empty?

    search_data(query)[:results].map do |result|
      PieceData.new(result)
    end
  end

  def self.search_data(query)
    ApiCallService.new.parsed_search(query)
  end
end
