require 'test_helper'

class ExperimentSystemAppsControllerTest < ActionController::TestCase
  setup do
    @experiment_system_app = experiment_system_apps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiment_system_apps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiment_system_app" do
    assert_difference('ExperimentSystemApp.count') do
      post :create, experiment_system_app: { desc: @experiment_system_app.desc }
    end

    assert_redirected_to experiment_system_app_path(assigns(:experiment_system_app))
  end

  test "should show experiment_system_app" do
    get :show, id: @experiment_system_app
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experiment_system_app
    assert_response :success
  end

  test "should update experiment_system_app" do
    put :update, id: @experiment_system_app, experiment_system_app: { desc: @experiment_system_app.desc }
    assert_redirected_to experiment_system_app_path(assigns(:experiment_system_app))
  end

  test "should destroy experiment_system_app" do
    assert_difference('ExperimentSystemApp.count', -1) do
      delete :destroy, id: @experiment_system_app
    end

    assert_redirected_to experiment_system_apps_path
  end
end
