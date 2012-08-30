require 'test_helper'

class TaskDimensionsControllerTest < ActionController::TestCase
  setup do
    @task_dimension = task_dimensions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_dimensions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_dimension" do
    assert_difference('TaskDimension.count') do
      post :create, :task_dimension => {  }
    end

    assert_redirected_to task_dimension_path(assigns(:task_dimension))
  end

  test "should show task_dimension" do
    get :show, :id => @task_dimension
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @task_dimension
    assert_response :success
  end

  test "should update task_dimension" do
    put :update, :id => @task_dimension, :task_dimension => {  }
    assert_redirected_to task_dimension_path(assigns(:task_dimension))
  end

  test "should destroy task_dimension" do
    assert_difference('TaskDimension.count', -1) do
      delete :destroy, :id => @task_dimension
    end

    assert_redirected_to task_dimensions_path
  end
end
