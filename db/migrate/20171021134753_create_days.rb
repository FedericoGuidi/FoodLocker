class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.references :diary
      t.date :date
      t.string :breakfast
      t.string :breakfast_kcal
      t.string :lunch
      t.string :lunch_kcal
      t.string :dinner
      t.string :dinner_kcal
      t.string :snack
      t.string :snack_kcal
      
      t.string :note

      t.timestamps
    end
  end
end
