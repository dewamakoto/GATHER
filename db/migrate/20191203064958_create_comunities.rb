class CreateComunities < ActiveRecord::Migration[5.2]
  def change
    create_table :comunities do |t|
      t.integer :user_comunity_id
      t.string :comunity_name
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
