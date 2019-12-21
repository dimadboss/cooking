require 'test_helper'

class ProductRecipesTest < ActiveSupport::TestCase
  def test_product_recipes_validates
    product = Product.create(name: "Молоко", density: nil)
    user = User.create(login: "test", password: "123", email: "ds-d@ya.ru")
    recipe = Recipe.create(user: user, title: "Кофе с молоком", description: "Описание")
    measure = Measure.create(munit: "ml", capacity: 0.000001)
    assert_equal ProductRecipe.create(product: product, recipe: recipe, quantity: 100, measure: measure).valid?, true
    assert_equal ProductRecipe.create(product: nil, recipe: recipe, quantity: 100, measure: measure).valid?, false
    assert_equal ProductRecipe.create(product: product, recipe: nil, quantity: 100, measure: measure).valid?, false
    assert_equal ProductRecipe.create(product: product, recipe: recipe, quantity: nil, measure: measure).valid?, false
    assert_equal ProductRecipe.create(product: product, recipe: recipe, quantity: 100, measure: nil).valid?, false
  end
end