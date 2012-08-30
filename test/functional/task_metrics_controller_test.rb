require 'test_helper'

class TaskMetricsControllerTest < ActionController::TestCase
  setup do
    @task_metric = task_metrics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_metrics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_metric" do
    assert_difference('TaskMetric.count') do
      post :create, :task_metric => {  }
    end

    assert_redirected_to task_metric_path(assigns(:task_metric))
  end

  test "should show task_metric" do
    get :show, :id => @task_metric
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @task_metric
    assert_response :success
  end

  test "should update task_metric" do
    put :update, :id => @task_metric, :task_metric => {  }
    assert_redirected_to task_metric_path(assigns(:task_metric))
  end

  test "should destroy task_metric" do
    assert_difference('TaskMetric.count', -1) do
      delete :destroy, :id => @task_metric
    end

    assert_redirected_to task_metrics_path
  end
end
