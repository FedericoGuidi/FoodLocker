class AddWaterToDay < ActiveRecord::Migration[5.1]
  def change
    add_column :days, :water, :string
  end
end
