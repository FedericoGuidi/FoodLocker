class AddGoogleAuthToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :google_auth, :boolean
  end
end
