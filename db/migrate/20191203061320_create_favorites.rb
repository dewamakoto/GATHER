class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :bar_id
      t.datetime :deleted_at
      t.references :bar, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

  end
end
