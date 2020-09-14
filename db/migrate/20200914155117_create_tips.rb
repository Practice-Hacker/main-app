class CreateTips < ActiveRecord::Migration[5.2]
  def change
    create_table :tips do |t|
      t.integer :difficulty_rating
      t.text :tip
      t.references :piece_id, foreign_key: true
      t.references :user_id, foreign_key: true

      t.timestamps
    end
  end
end
