require 'test_helper'
require 'minitest/autorun'

class MeasureTest < ActiveSupport::TestCase
 test 'measure validates' do
    assert !Measure.new.valid?
  end
end