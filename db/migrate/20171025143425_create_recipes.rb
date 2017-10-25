class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.references :user, foreign_key: true
      t.string :photo
      t.string :title
      t.string :kcal
      t.string :ingredients
      t.string :directions

      t.timestamps
    end
  end
end
