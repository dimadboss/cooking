require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_nil_user_validates
    assert_equal User.create(login: nil).valid?, false
    assert_equal User.create(password: nil).valid?, false
    assert_equal User.create(email: nil).valid?, false
  end

  def test_unique_user_validates
    assert_equal User.create(login: "test", password: "123", email: "ds-d@ya.ru").valid?, true
    assert_equal User.create(login: "test", password: "1234", email: "d@ya.ru").valid?, false
  end
end