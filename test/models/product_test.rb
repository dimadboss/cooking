require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'product validates' do
    assert !Product.new.valid?
  end
end