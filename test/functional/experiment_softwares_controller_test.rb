require 'test_helper'

class ExperimentSoftwaresControllerTest < ActionController::TestCase
  setup do
    @experiment_software = experiment_softwares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiment_softwares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiment_software" do
    assert_difference('ExperimentSoftware.count') do
      post :create, :experiment_software => {  }
    end

    assert_redirected_to experiment_software_path(assigns(:experiment_software))
  end

  test "should show experiment_software" do
    get :show, :id => @experiment_software
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @experiment_software
    assert_response :success
  end

  test "should update experiment_software" do
    put :update, :id => @experiment_software, :experiment_software => {  }
    assert_redirected_to experiment_software_path(assigns(:experiment_software))
  end

  test "should destroy experiment_software" do
    assert_difference('ExperimentSoftware.count', -1) do
      delete :destroy, :id => @experiment_software
    end

    assert_redirected_to experiment_softwares_path
  end
end
