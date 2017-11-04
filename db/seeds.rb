# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Site.create!(id: "1", suspended: "false")
User.create!(name:  "Admin User",
             email: "admin@foodlocker.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
Diary.create!(user_id: "1")
Day.create!(diary_id: "1", date: "2017-10-22")
Quiz.create!(user_id: 1, name: "Admin",
                gender: "M",
                height: "1.70",
                weight: "65",
                age: "22",
                water: "3",
                sport: true,
                sport_time: "45",
                target_weight: "60",
                kcal: "1300")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@foodlocker.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
  Diary.create!(user_id: n+2)
  Day.create!(diary_id: n+2, date: DateTime.new(2017,10,22))
end

users = User.order(:created_at).take(6)
50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# Creating recipes
file = File.open("db/recipes.txt", "rb")
contents = file.read
contents = contents.force_encoding('UTF-8').gsub("\u2028", " ")
recipes = contents.split("|")

(0..122).step(4) do |n|
    title = recipes[n].split(":")[1]
    kcal = recipes[n+1].split(":")[1]
    ingredients = recipes[n+2].split(":")[1]
    directions = recipes[n+3].split(":")[1]
    Recipe.create!(user_id: 1, title: title, kcal: kcal, ingredients: ingredients, directions: directions)
end