class ProductAbout < ApplicationRecord
  belongs_to :product
  validates :product_id, :description, presence: true
end