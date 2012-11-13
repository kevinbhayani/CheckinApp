require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
<<<<<<< HEAD
=======

  test "should not save without data" do
    vol = Event.new
    assert !vol.save, "Saved the event with no name/time"
  end
>>>>>>> 526777241f19b950f3081fb7e85580ea57918682
end
