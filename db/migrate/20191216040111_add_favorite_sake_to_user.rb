class AddFavoriteSakeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :favorite_sake, :string
  end
end
