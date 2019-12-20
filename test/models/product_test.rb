require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def test_nil_product_validates
    assert_equal Product.create(name: nil).valid?, false
    assert_equal Product.create(name: "Молоко", density: nil).valid?, true
  end

  def test_unique_product_validates
    assert_equal Product.create(name: "Молоко", density: nil).valid?, true
    assert_equal Product.create(name: "Молоко", density: nil).valid?, false
  end
end