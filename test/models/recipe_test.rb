require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def test_nil_recipe_validates
    user1 = User.create(login: "test", password: "123", email: "ds-d@ya.ru")
    assert_equal Recipe.create(user: nil, title: "Кофе с молоком", description: "Описание").valid?, false
    assert_equal Recipe.create(user: user1, title: nil, description: "Описание").valid?, false
    assert_equal Recipe.create(user: user1, title: "Кофе с молоком", description: nil).valid?, false
    User.delete_all
  end

  def test_recipe_validates
    user1 = User.create(login: "test", password: "123", email: "ds-d@ya.ru")
    assert_equal Recipe.create(user: user1, title: "Чай с молоком", description: "Описание").valid?, true
    User.delete_all
  end
end
