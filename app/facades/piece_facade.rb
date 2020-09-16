class PieceFacade
  def initialize(api_work_id)
    @data = get_by_api_work_id(api_work_id)
  end

  def to_piece
    p = Piece.new
    p.title = @data[:work][:title]
    p.subtitle = @data[:work][:subtitle]
    p.composer = @data[:composer][:name]
    p.api_work_id = @data[:work][:id]
    p
  end

  def get_by_api_work_id(api_work_id)
    ApiCallService.new.get_by_work_id(api_work_id)
  end
end
