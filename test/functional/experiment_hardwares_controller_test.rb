require 'test_helper'

class ExperimentHardwaresControllerTest < ActionController::TestCase
  setup do
    @experiment_hardware = experiment_hardwares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiment_hardwares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiment_hardware" do
    assert_difference('ExperimentHardware.count') do
      post :create, :experiment_hardware => {  }
    end

    assert_redirected_to experiment_hardware_path(assigns(:experiment_hardware))
  end

  test "should show experiment_hardware" do
    get :show, :id => @experiment_hardware
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @experiment_hardware
    assert_response :success
  end

  test "should update experiment_hardware" do
    put :update, :id => @experiment_hardware, :experiment_hardware => {  }
    assert_redirected_to experiment_hardware_path(assigns(:experiment_hardware))
  end

  test "should destroy experiment_hardware" do
    assert_difference('ExperimentHardware.count', -1) do
      delete :destroy, :id => @experiment_hardware
    end

    assert_redirected_to experiment_hardwares_path
  end
end
