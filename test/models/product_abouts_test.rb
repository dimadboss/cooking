require 'test_helper'

class ProductAboutsTest < ActiveSupport::TestCase
  def test_nil_product_about_validates
    product = Product.create(name: "Вода", density: nil)
    assert_equal ProductAbout.create(product: product, description: "Веганское").valid?, true
    assert_equal ProductAbout.create(product: product, description: nil).valid?, false
  end

end