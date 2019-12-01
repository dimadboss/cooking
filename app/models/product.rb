class Product < ApplicationRecord
  has_many :product_abouts
  has_many :product_recipes
  validates :name, presence: true
end