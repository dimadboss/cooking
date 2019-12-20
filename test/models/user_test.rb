require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_user_validates
    assert_equal User.create(login: nil).valid?, false
    assert_equal User.create(login: nil).valid?, false
  end
end