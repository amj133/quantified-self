# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FoodMeal.all.destroy_all
Meal.all.destroy_all
Food.all.destroy_all

breakfast = Meal.create(name: "Breakfast")
lunch = Meal.create(name: "Lunch")
dinner = Meal.create(name: "Dinner")
snack = Meal.create(name: "Snack")

25.times do |i|
  food = Food.create(name: "Name-#{i}",
                     calories: 100 + i)
  if i < 5
    FoodMeal.create(meal: breakfast, food: food)
  elsif i <10
    FoodMeal.create(meal: lunch, food: food)
  elsif i < 15
    FoodMeal.create(meal: dinner, food: food)
  elsif i < 20
    FoodMeal.create(meal: snack, food: food)
  end
end
