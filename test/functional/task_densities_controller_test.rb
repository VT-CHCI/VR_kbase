require 'test_helper'

class TaskDensitiesControllerTest < ActionController::TestCase
  setup do
    @task_density = task_densities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_densities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_density" do
    assert_difference('TaskDensity.count') do
      post :create, :task_density => {  }
    end

    assert_redirected_to task_density_path(assigns(:task_density))
  end

  test "should show task_density" do
    get :show, :id => @task_density
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @task_density
    assert_response :success
  end

  test "should update task_density" do
    put :update, :id => @task_density, :task_density => {  }
    assert_redirected_to task_density_path(assigns(:task_density))
  end

  test "should destroy task_density" do
    assert_difference('TaskDensity.count', -1) do
      delete :destroy, :id => @task_density
    end

    assert_redirected_to task_densities_path
  end
end
