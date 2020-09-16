class PieceFacade
  def initialize(api_work_id)
    data = get_by_work_id(api_work_id)
    PieceData.new(data)
  end

  def self.get_by_api_work_id(api_work_id)
    ApiCallService.new.get_by_work_id(api_work_id)
  end
end
