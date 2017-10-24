class AddTypeToNotification < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :ntype, :integer
  end
end
