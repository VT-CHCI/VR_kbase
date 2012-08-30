require 'test_helper'

class TaskCategoriesControllerTest < ActionController::TestCase
  setup do
    @task_category = task_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_category" do
    assert_difference('TaskCategory.count') do
      post :create, :task_category => {  }
    end

    assert_redirected_to task_category_path(assigns(:task_category))
  end

  test "should show task_category" do
    get :show, :id => @task_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @task_category
    assert_response :success
  end

  test "should update task_category" do
    put :update, :id => @task_category, :task_category => {  }
    assert_redirected_to task_category_path(assigns(:task_category))
  end

  test "should destroy task_category" do
    assert_difference('TaskCategory.count', -1) do
      delete :destroy, :id => @task_category
    end

    assert_redirected_to task_categories_path
  end
end
