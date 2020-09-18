class SearchFacade
  def self.pieces(query, offset)
    res = search_data(query)[:results] || []

    res.map do |result|
      PieceData.new(result)
    end
  end

  def self.search_data(query, offset)
    ApiCallService.new.parsed_search(query, offset)
  end
end
