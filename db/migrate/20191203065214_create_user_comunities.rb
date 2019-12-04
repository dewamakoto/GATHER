class CreateUserComunities < ActiveRecord::Migration[5.2]
  def change
    create_table :user_comunities do |t|
      t.integer :user_id
      t.integer :comunity_id
      t.string :user_name
      t.datetime :deleted_at

      t.references :user, null: false, foreign_key: true
      t.references :comunity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
