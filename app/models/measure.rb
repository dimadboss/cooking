class Measure < ApplicationRecord
  validates :munit, :capacity, presence: true
  before_validation :ensure_capacity_positive

  private

  def ensure_capacity_positive
    this.errors << 'Capacity must be positive' if capacity < 0
  end
end