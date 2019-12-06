require 'test_helper'

class MeasureTest < ActiveSupport::TestCase
 test 'measure validates hhh' do
    assert !Measure.new.valid?
  end
end