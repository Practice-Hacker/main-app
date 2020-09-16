require 'rails_helper'

RSpec.describe PieceData do
  it 'should have attributes ' do
    result = { composer: { name: 'Thomas Adès', id: '130' },
               work: { title: 'Violin Concerto, "Concentric Paths"', id: '28072', subtitle: '' } }

    piece = PieceData.new(result)
    expect(piece).to be_instance_of PieceData
    expect(piece.name).to eq(result[:composer][:name])
    expect(piece.title).to eq(result[:work][:title])
    expect(piece.subtitle).to eq(result[:work][:subtitle])
    expect(piece.api_work_id).to eq(result[:work][:id])
  end

end
