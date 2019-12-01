class ProductRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :measure
  belongs_to :product

  validates :product_id, :recipe_id, :quantity, :measure_id, presence: true

  before_validation :ensure_quantity_positive

  private

  def ensure_quantity_positive
    this.errors << 'Quantity must be positive' if quantity < 0
  end
end