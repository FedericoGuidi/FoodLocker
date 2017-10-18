class AddPrivateProfileToUsers < ActiveRecord::Migration[5.1]
  def change
      add_column :users, :is_private, :boolean, default: false
  end
end
