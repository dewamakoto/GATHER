class CreateBars < ActiveRecord::Migration[5.2]
  def change
    create_table :bars do |t|
      t.integer :post_id
      t.string :name
      t.string :bar_image
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :category
      t.string :sports
      t.text :body
      t.datetime :deleted_at


      t.timestamps
    end
  end
end
