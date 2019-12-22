class ProductRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :measure
  belongs_to :product

  validates :product_id, :recipe_id, :quantity, :measure_id, presence: true

  before_validation :ensure_quantity_positive

  def convert(measure_to_id)
    measure_to = Measure.find(measure_to_id)
    self.quantity = self.quantity * self.measure.capacity / measure_to.capacity
    self.measure_id = measure_to_id
  end


  private

  def ensure_quantity_positive
    this.errors << 'Quantity must be positive' if !quantity.nil? and quantity <= 0
  end


end