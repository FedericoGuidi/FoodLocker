factory :recipe do |f|
  f.title { "Titolo" }
  f.kcal {"1200"}
  f.ingredients {"ingredienti"}
  f.directions {"indicazioni"}
     
end

factory :invalid_recipe, parent: :recipe do |f|
  f.name nil
end