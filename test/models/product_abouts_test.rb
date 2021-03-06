require 'test_helper'

class ProductAboutsTest < ActiveSupport::TestCase
  def test_nil_product_about_validates
    product = Product.create(name: "Вода", density: nil)
    assert_equal ProductAbout.create(product: product, description: "Веганское").valid?, true
    assert_equal ProductAbout.create(product: product, description: nil).valid?, false
    assert_equal ProductAbout.create(product: nil, description: "Веганское").valid?, false
    Product.delete_all
  end

end