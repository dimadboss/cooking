require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_user_validates
    assert !User.new.valid?
  end
end