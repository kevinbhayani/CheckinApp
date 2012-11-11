require 'test_helper'
 
class StudentControllerTest < ActionController::TestCase
  def setup
    @controller = StudentsController.new
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    # Assert the total count in the DB has increased by 1 (default value)
    assert_difference('Student.count') do
      post :create, :student => {:name => "Allie Deford", :grade => 15, :birthdate => "1991-06-28", :parentName => "Cathy", :parentAddress => "Lafayette", :parentPhone => "555-555-5555", :contactName => "Julia", :contactPhone => "312-555-5555" }
    end

    assert_redirected_to students_path#(assigns(:student))
  end

  test "should show student" do
    get :show, :id => students(:allie).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => students(:allie).to_param
    assert_response :success
  end

  test "should update student" do
    put :update, :id => students(:allie).to_param, :student => {:name => "Allie Deford", :grade => 15, :birthdate => "1991-06-28", :parentName => "Cathy", :parentAddress => "Lafayette", :parentPhone => "555-555-5555", :contactName => "Julia", :contactPhone => "312-555-5555" }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, :id => students(:allie).to_param
    end
    assert_redirected_to students_path
  end

end
