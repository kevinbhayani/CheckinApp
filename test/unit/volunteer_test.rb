require 'test_helper'
 
class VolunteerTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save without data" do
    vol = Volunteer.new
    assert !vol.save, "Saved the volunteer with no name/pin"
  end
end
