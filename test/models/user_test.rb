require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_user_validates
    _(User.create(name: nil).valid?).must_equal false
  end
end