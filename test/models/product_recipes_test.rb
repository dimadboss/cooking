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


  def test_convert
    product = Product.create(name: "Молоко", density: nil)
    user = User.create(login: "test", password: "123", email: "ds-d@ya.ru")
    recipe = Recipe.create(user: user, title: "Кофе с молоком", description: "Описание")
    measure = Measure.create(munit: "ml", capacity: 0.000001)
    measure_to = Measure.create(munit: "l", capacity: 0.001)
    product_recipe = ProductRecipe.create(product: product, recipe: recipe, quantity: 42, measure: measure)
    product_recipe.convert(measure_to.id)
    assert_equal product_recipe.quantity, 0.042
    assert_equal product_recipe.measure.munit, "l"
  end

  def test_convert_2
    product = Product.create(name: "Молоко", density: nil)
    user = User.create(login: "test", password: "123", email: "ds-d@ya.ru")
    recipe = Recipe.create(user: user, title: "Кофе с молоком", description: "Описание")
    measure = Measure.create(munit: "glass", capacity: 0.000236588)
    measure_to = Measure.create(munit: "ml", capacity: 0.000001)
    product_recipe = ProductRecipe.create(product: product, recipe: recipe, quantity: 1, measure: measure)
    product_recipe.convert(measure_to.id)
    assert_in_delta product_recipe.quantity, 236.5882, 0.001
    assert_equal product_recipe.measure.munit, "ml"
  end
end