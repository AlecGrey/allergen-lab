# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Allergy.destroy_all
DishIngredient.destroy_all
Dish.destroy_all
Ingredient.destroy_all
User.destroy_all

5.times do |i|
    User.create(name: Faker::Name.name)
end

30.times do |i|
    Ingredient.create(name: Faker::Food.ingredient)
end

10.times do |i|
    dish = Dish.new(name: Faker::Food.dish)
    dish.user = User.all.sample
    5.times {|j| dish.ingredients << Ingredient.all.sample}
    dish.save
end
