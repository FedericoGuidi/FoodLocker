factory :quiz do |f|
  f.name { "Pippo" }
      f.gender {"M"}
      f.height {"1.70"}
      f.weight {"65"}
      f.age {"20"}
      f.water {"3"}
      f.sport {true}
      f.sport_time {"45"}
      f.target_weight {"60"}
      f.kcal {"1300"}
end

factory :invalid_quiz, parent: :quiz do |f|
  f.name nil
end