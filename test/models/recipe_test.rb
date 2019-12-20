require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def test_nil_recipe_validates
    assert_equal Recipe.create(user_id: nil).valid?, false
    assert_equal Recipe.create(title: nil).valid?, false
    assert_equal Recipe.create(description: nil).valid?, false
  end

  def test_recipe_validates
    user1 = User.create(login: "test", password: "123", email: "ds-d@ya.ru")
    assert_equal Recipe.create(user: user1, title: "Кофе с молоком", description: "Описание").valid?, true
  end
end
