class AddFavoriteSportsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :favorite_sports, :string
  end
end
