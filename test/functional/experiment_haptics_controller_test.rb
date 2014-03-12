require 'test_helper'

class ExperimentHapticsControllerTest < ActionController::TestCase
  setup do
    @experiment_haptic = experiment_haptics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiment_haptics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiment_haptic" do
    assert_difference('ExperimentHaptic.count') do
      post :create, experiment_haptic: { desc: @experiment_haptic.desc }
    end

    assert_redirected_to experiment_haptic_path(assigns(:experiment_haptic))
  end

  test "should show experiment_haptic" do
    get :show, id: @experiment_haptic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experiment_haptic
    assert_response :success
  end

  test "should update experiment_haptic" do
    put :update, id: @experiment_haptic, experiment_haptic: { desc: @experiment_haptic.desc }
    assert_redirected_to experiment_haptic_path(assigns(:experiment_haptic))
  end

  test "should destroy experiment_haptic" do
    assert_difference('ExperimentHaptic.count', -1) do
      delete :destroy, id: @experiment_haptic
    end

    assert_redirected_to experiment_haptics_path
  end
end
