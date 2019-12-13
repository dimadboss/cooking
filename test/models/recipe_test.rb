require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test 'recipe validates' do
    assert !Recipe.new.valid?
  end
end
