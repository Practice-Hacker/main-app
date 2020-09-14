class Piece
  attr_reader :title, :name, :subtitle, :piece_id
  def initialize(data)
    @name = data[:composer][:name]
    @title = data[:work][:title]
    @subtitle = data[:work][:subtitle]
    @piece_id = data[:work][:id]
  end
end
