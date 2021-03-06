class SearchFacade
  def self.pieces(query, offset = 0)
    res = search_data(query, offset)[:results] || []

    res.map do |result|
      PieceData.new(result)
    end
  end

  def self.search_data(query, offset = 0)
    ApiCallService.new.parsed_search(query, offset)
  end
end
