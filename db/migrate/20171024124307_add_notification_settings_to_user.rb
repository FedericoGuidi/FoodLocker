class AddNotificationSettingsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :eat_time, :time
    add_column :users, :drink_time, :time
    add_column :users, :workout_time, :time
    add_column :users, :weight_time, :time
  end
end
