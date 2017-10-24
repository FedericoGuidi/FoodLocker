class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.string :content
      t.time :time

      t.timestamps
    end
  end
end
