class AddKcalToQuiz < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :kcal, :string
  end
end
