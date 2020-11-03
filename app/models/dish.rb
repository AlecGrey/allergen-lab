class Dish < ApplicationRecord
  belongs_to :user
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  validates :name, presence: true

  attr_accessor :ingredient_id, :ingredient_quantity

  def add_ingredient(ingredient, quantity)
    quantity.times do |i|
      self.ingredients << ingredient
    end
  end

end
