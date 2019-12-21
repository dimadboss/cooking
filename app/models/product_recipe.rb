class ProductRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :measure
  belongs_to :product

  validates :product_id, :recipe_id, :quantity, :measure_id, presence: true

  before_validation :ensure_quantity_positive

  def convert(measure_to_id)
    measure_from = Measure.find_by(:measure_id)
    measure_to = Measure.find_by(measure_to_id)
    :quantity * measure_from.capacity / measure_to.capacity
  end


  private

  def ensure_quantity_positive
    this.errors << 'Quantity must be positive' if !quantity.nil? and quantity <= 0
  end


end