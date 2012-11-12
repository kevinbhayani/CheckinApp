require 'test_helper'
 
class VolunteerControllerTest < ActionController::TestCase
  def setup
    @controller = VolunteersController.new
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:volunteers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create volunteer" do
    # Assert the total count in the DB has increased by 1 (default value)
    assert_difference('Volunteer.count') do
      post :create, :volunteer => {:name => "Kernel Sanders", :pin => 1234 }
    end

    assert_redirected_to volunteers_path
  end

  test "should show volunteer" do
    get :show, :id => volunteers(:colonel).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => volunteers(:colonel).to_param
    assert_response :success
  end

  test "should update volunteer" do
    put :update, :id => volunteers(:colonel).to_param, :volunteer => {:name => "Kernel Sanders", :pin => 1234 }
    assert_redirected_to volunteers_path
  end

  test "should destroy volunteer" do
    assert_difference('Volunteer.count', -1) do
      delete :destroy, :id => volunteers(:colonel).to_param
    end
    assert_redirected_to volunteers_path
  end

end
