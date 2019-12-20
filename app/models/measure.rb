class Measure < ApplicationRecord
  validates :munit, :capacity, presence: true
  validates :munit, uniqueness: true
  before_validation :ensure_capacity_positive

  private

  def ensure_capacity_positive
    this.errors << 'Capacity must be positive' if !capacity.nil? and capacity <= 0
  end
end