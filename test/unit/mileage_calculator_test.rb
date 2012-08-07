require 'test_helper'

class MileageCalculatorTest < ActiveSupport::TestCase

  test "the distance from Chicago to New York is 740" do
    mc = MileageCalculator.new("ORD", "JFK")
    assert_equal 740, mc.miles
  end

  test "the distance from Chicago to Boston is 866" do
    mc = MileageCalculator.new("ORD", "BOS")
    assert_equal 866, mc.miles
  end

  test "the distance from Boston to Chicago is 866" do
    mc = MileageCalculator.new("BOS", "ORD")
    assert_equal 866, mc.miles
  end

end
