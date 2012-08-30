require 'test_helper'

class FindingSpecificitiesControllerTest < ActionController::TestCase
  setup do
    @finding_specificity = finding_specificities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finding_specificities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finding_specificity" do
    assert_difference('FindingSpecificity.count') do
      post :create, :finding_specificity => {  }
    end

    assert_redirected_to finding_specificity_path(assigns(:finding_specificity))
  end

  test "should show finding_specificity" do
    get :show, :id => @finding_specificity
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @finding_specificity
    assert_response :success
  end

  test "should update finding_specificity" do
    put :update, :id => @finding_specificity, :finding_specificity => {  }
    assert_redirected_to finding_specificity_path(assigns(:finding_specificity))
  end

  test "should destroy finding_specificity" do
    assert_difference('FindingSpecificity.count', -1) do
      delete :destroy, :id => @finding_specificity
    end

    assert_redirected_to finding_specificities_path
  end
end
