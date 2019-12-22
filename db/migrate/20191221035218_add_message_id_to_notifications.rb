class AddMessageIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :message_id, :integer
  end

  	add_index :notifications, :message_id
end

