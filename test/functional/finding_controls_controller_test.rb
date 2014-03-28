require 'test_helper'

class FindingControlsControllerTest < ActionController::TestCase
  setup do
    @finding_control = finding_controls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finding_controls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finding_control" do
    assert_difference('FindingControl.count') do
      post :create, finding_control: {  }
    end

    assert_redirected_to finding_control_path(assigns(:finding_control))
  end

  test "should show finding_control" do
    get :show, id: @finding_control
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finding_control
    assert_response :success
  end

  test "should update finding_control" do
    put :update, id: @finding_control, finding_control: {  }
    assert_redirected_to finding_control_path(assigns(:finding_control))
  end

  test "should destroy finding_control" do
    assert_difference('FindingControl.count', -1) do
      delete :destroy, id: @finding_control
    end

    assert_redirected_to finding_controls_path
  end
end
