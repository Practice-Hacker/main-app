require 'rails_helper'

RSpec.describe Piece do
  it 'should have attributes ' do
    result = { composer: { name: 'Thomas Adès', id: '130' },
               work: { title: 'Violin Concerto, "Concentric Paths"', id: '28072', subtitle: '' } }

    piece = Piece.new(result)
    expect(piece).to be_instance_of Piece
    expect(piece.name).to eq(result[:composer][:name])
    expect(piece.title).to eq(result[:work][:title])
    expect(piece.subtitle).to eq(result[:work][:subtitle])
    expect(piece.work_id).to eq(result[:work][:id])
  end

end

