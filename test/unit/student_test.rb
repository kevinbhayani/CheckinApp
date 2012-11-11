require 'test_helper'
 
class StudentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "should not save without data" do
    vol = Student.new
    assert !vol.save, "Saved the student with no name/pin"
  end

end
