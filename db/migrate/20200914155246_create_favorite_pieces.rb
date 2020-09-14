class CreateFavoritePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_pieces do |t|
      t.references :user, foreign_key: true
      t.references :piece, foreign_key: true

      t.timestamps
    end
  end
end
