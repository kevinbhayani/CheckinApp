require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save without data" do
    vol = Event.new
    assert !vol.save, "Saved the event with no name/time"
  end
end
