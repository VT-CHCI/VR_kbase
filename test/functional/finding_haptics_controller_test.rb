require 'test_helper'

class FindingHapticsControllerTest < ActionController::TestCase
  setup do
    @finding_haptic = finding_haptics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finding_haptics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finding_haptic" do
    assert_difference('FindingHaptic.count') do
      post :create, finding_haptic: {  }
    end

    assert_redirected_to finding_haptic_path(assigns(:finding_haptic))
  end

  test "should show finding_haptic" do
    get :show, id: @finding_haptic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finding_haptic
    assert_response :success
  end

  test "should update finding_haptic" do
    put :update, id: @finding_haptic, finding_haptic: {  }
    assert_redirected_to finding_haptic_path(assigns(:finding_haptic))
  end

  test "should destroy finding_haptic" do
    assert_difference('FindingHaptic.count', -1) do
      delete :destroy, id: @finding_haptic
    end

    assert_redirected_to finding_haptics_path
  end
end
