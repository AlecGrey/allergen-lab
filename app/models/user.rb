class User < ApplicationRecord
    has_many :dishes
    has_many :allergies
    has_many :ingredients, through: :allergies
end
