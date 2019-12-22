class Measure < ApplicationRecord
  validates :munit, :capacity, presence: true
  validates :munit, uniqueness: true
  before_validation :ensure_capacity_positive

  def convert(munit_to_id)
    self.capacity / Measure.find(munit_to_id).capacity
  end

  private

  def ensure_capacity_positive
    this.errors << 'Capacity must be positive' if !capacity.nil? and capacity <= 0
  end
end