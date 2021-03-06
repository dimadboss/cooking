require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_nil_user_validates
    assert_equal User.create(login: nil, password: "123", email: "ds-d@ya.ru").valid?, false
    assert_equal User.create(login: "test", password: nil, email: "ds-d@ya.ru").valid?, false
    assert_equal User.create(login: "test", password: "1234", email: nil).valid?, false
    User.delete_all
  end

  def test_unique_user_validates
    assert_equal User.create(login: "test", password: "123", email: "ds-d@ya.ru").valid?, true
    assert_equal User.create(login: "test", password: "1234", email: "d@ya.ru").valid?, false
    User.delete_all
  end
end