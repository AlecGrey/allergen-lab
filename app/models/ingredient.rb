class Ingredient < ApplicationRecord
    has_many :dish_ingredients
    has_many :dishes, through: :dish_ingredients

    has_many :allergies
    has_many :users, through: :allergies
end
