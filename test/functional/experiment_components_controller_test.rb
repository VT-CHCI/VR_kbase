require 'test_helper'

class ExperimentComponentsControllerTest < ActionController::TestCase
  setup do
    @experiment_component = experiment_components(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiment_components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiment_component" do
    assert_difference('ExperimentComponent.count') do
      post :create, :experiment_component => {  }
    end

    assert_redirected_to experiment_component_path(assigns(:experiment_component))
  end

  test "should show experiment_component" do
    get :show, :id => @experiment_component
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @experiment_component
    assert_response :success
  end

  test "should update experiment_component" do
    put :update, :id => @experiment_component, :experiment_component => {  }
    assert_redirected_to experiment_component_path(assigns(:experiment_component))
  end

  test "should destroy experiment_component" do
    assert_difference('ExperimentComponent.count', -1) do
      delete :destroy, :id => @experiment_component
    end

    assert_redirected_to experiment_components_path
  end
end
