require 'test_helper'
require 'minitest/autorun'

class MeasureTest < ActiveSupport::TestCase
  def test_nil_measure_validates
    assert_equal Measure.create(munit: nil).valid?, false
    assert_equal Measure.create(capacity: nil).valid?, false
    assert_equal Measure.create(munit: nil, capacity: 0.03).valid?, false
    assert_equal Measure.create(munit: "ml", capacity: nil).valid?, false
    Measure.delete_all
  end

  def test_unique_measure_validates
    assert_equal Measure.create(munit: "ml", capacity: 0.000001).valid?, true
    assert_equal Measure.create(munit: "ml", capacity: 0.001).valid?, false
    Measure.delete_all
  end
end