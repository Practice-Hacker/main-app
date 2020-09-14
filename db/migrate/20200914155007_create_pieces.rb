class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.string :title
      t.string :subtitle
      t.string :composer

      t.timestamps
    end
  end
end
