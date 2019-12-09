class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :bar_id
      t.string :image_id
      t.string :sports
      t.float :rate
      t.string :title
      t.text :body
      t.datetime :deleted_at


      t.timestamps
    end
  end
end
