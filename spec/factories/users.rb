factory :user do |f|
  f.name { "Pippo" }
  f.email {"pippo@pippo.it"}
  f.password {"paperino"}
  f.password_confirmation {"paperino"}
  
     
end

factory :invalid_user, parent: :user do |f|
  f.name nil
end