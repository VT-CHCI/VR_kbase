require 'test_helper'

class FindingSystemAppsControllerTest < ActionController::TestCase
  setup do
    @finding_system_app = finding_system_apps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finding_system_apps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finding_system_app" do
    assert_difference('FindingSystemApp.count') do
      post :create, finding_system_app: {  }
    end

    assert_redirected_to finding_system_app_path(assigns(:finding_system_app))
  end

  test "should show finding_system_app" do
    get :show, id: @finding_system_app
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finding_system_app
    assert_response :success
  end

  test "should update finding_system_app" do
    put :update, id: @finding_system_app, finding_system_app: {  }
    assert_redirected_to finding_system_app_path(assigns(:finding_system_app))
  end

  test "should destroy finding_system_app" do
    assert_difference('FindingSystemApp.count', -1) do
      delete :destroy, id: @finding_system_app
    end

    assert_redirected_to finding_system_apps_path
  end
end
