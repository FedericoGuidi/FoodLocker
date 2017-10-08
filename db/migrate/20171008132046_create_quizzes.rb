class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.string :gender
      t.string :height
      t.string :weight
      t.string :age
      t.string :water
      t.boolean :sport
      t.string :sport_time
      t.string :target_weight
      t.references :user, index: true

      t.timestamps
    end
  end
end
