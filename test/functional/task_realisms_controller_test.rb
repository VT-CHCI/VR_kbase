require 'test_helper'

class TaskRealismsControllerTest < ActionController::TestCase
  setup do
    @task_realism = task_realisms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_realisms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_realism" do
    assert_difference('TaskRealism.count') do
      post :create, :task_realism => {  }
    end

    assert_redirected_to task_realism_path(assigns(:task_realism))
  end

  test "should show task_realism" do
    get :show, :id => @task_realism
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @task_realism
    assert_response :success
  end

  test "should update task_realism" do
    put :update, :id => @task_realism, :task_realism => {  }
    assert_redirected_to task_realism_path(assigns(:task_realism))
  end

  test "should destroy task_realism" do
    assert_difference('TaskRealism.count', -1) do
      delete :destroy, :id => @task_realism
    end

    assert_redirected_to task_realisms_path
  end
end
