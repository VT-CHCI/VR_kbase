require 'test_helper'

class TaskScalesControllerTest < ActionController::TestCase
  setup do
    @task_scale = task_scales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_scales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_scale" do
    assert_difference('TaskScale.count') do
      post :create, :task_scale => {  }
    end

    assert_redirected_to task_scale_path(assigns(:task_scale))
  end

  test "should show task_scale" do
    get :show, :id => @task_scale
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @task_scale
    assert_response :success
  end

  test "should update task_scale" do
    put :update, :id => @task_scale, :task_scale => {  }
    assert_redirected_to task_scale_path(assigns(:task_scale))
  end

  test "should destroy task_scale" do
    assert_difference('TaskScale.count', -1) do
      delete :destroy, :id => @task_scale
    end

    assert_redirected_to task_scales_path
  end
end
