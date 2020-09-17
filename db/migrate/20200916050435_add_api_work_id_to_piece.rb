class AddApiWorkIdToPiece < ActiveRecord::Migration[5.2]
  def change
    add_column :pieces, :api_work_id, :string
  end
end
