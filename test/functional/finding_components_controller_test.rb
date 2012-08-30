require 'test_helper'

class FindingComponentsControllerTest < ActionController::TestCase
  setup do
    @finding_component = finding_components(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finding_components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finding_component" do
    assert_difference('FindingComponent.count') do
      post :create, :finding_component => {  }
    end

    assert_redirected_to finding_component_path(assigns(:finding_component))
  end

  test "should show finding_component" do
    get :show, :id => @finding_component
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @finding_component
    assert_response :success
  end

  test "should update finding_component" do
    put :update, :id => @finding_component, :finding_component => {  }
    assert_redirected_to finding_component_path(assigns(:finding_component))
  end

  test "should destroy finding_component" do
    assert_difference('FindingComponent.count', -1) do
      delete :destroy, :id => @finding_component
    end

    assert_redirected_to finding_components_path
  end
end
