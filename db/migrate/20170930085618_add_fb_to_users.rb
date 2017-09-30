class AddFbToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fb, :boolean, default: false, after: :google_auth
  end
end
