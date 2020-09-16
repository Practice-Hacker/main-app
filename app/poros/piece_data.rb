class PieceData
  attr_reader :title, :name, :subtitle, :api_work_id
  def initialize(data)
    @name = data[:composer][:name]
    @composer = data[:work][:title]
    @subtitle = data[:work][:subtitle]
    @api_work_id = data[:work][:id]
  end
end
