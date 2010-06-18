require 'test_helper'

class InterviewTest < ActiveSupport::TestCase

  #the tests here are pretty rudimentary and probably need to be expanded.

  test "minimal" do
    assert_equal Interview.new().save, false

    assert Interview.new(:name => "Bill Joe Jim Bob Shabadu").save
  end
end
