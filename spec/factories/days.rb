factory :day do |f|
  f.breakfast { "breakfast" }
  f.breakfast_kcal { "100"}
    f.snack { "snack" }
  f.snack_kcal { "100"}
    f.lunch { "lunch" }
  f.lunch_kcal { "100"}
    f.dinner { "lunch" }
  f.dinner_kcal { "100"}
     
end

factory :invalid_day, parent: :day do |f|
  f.name nil
end