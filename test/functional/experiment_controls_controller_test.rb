require 'test_helper'

class ExperimentControlsControllerTest < ActionController::TestCase
  setup do
    @experiment_control = experiment_controls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiment_controls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiment_control" do
    assert_difference('ExperimentControl.count') do
      post :create, experiment_control: { desc: @experiment_control.desc }
    end

    assert_redirected_to experiment_control_path(assigns(:experiment_control))
  end

  test "should show experiment_control" do
    get :show, id: @experiment_control
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experiment_control
    assert_response :success
  end

  test "should update experiment_control" do
    put :update, id: @experiment_control, experiment_control: { desc: @experiment_control.desc }
    assert_redirected_to experiment_control_path(assigns(:experiment_control))
  end

  test "should destroy experiment_control" do
    assert_difference('ExperimentControl.count', -1) do
      delete :destroy, id: @experiment_control
    end

    assert_redirected_to experiment_controls_path
  end
end
