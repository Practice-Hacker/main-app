class PieceData
  attr_reader :composer, :title, :subtitle, :api_work_id
  def initialize(data)
    @composer = data[:composer][:name]
    @title = data[:work][:title]
    @subtitle = data[:work][:subtitle]
    @api_work_id = data[:work][:id]
  end
end
