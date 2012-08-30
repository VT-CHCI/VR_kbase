require 'test_helper'

class SpecificitiesControllerTest < ActionController::TestCase
  setup do
    @specificity = specificities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specificities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specificity" do
    assert_difference('Specificity.count') do
      post :create, :specificity => { :level => @specificity.level }
    end

    assert_redirected_to specificity_path(assigns(:specificity))
  end

  test "should show specificity" do
    get :show, :id => @specificity
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @specificity
    assert_response :success
  end

  test "should update specificity" do
    put :update, :id => @specificity, :specificity => { :level => @specificity.level }
    assert_redirected_to specificity_path(assigns(:specificity))
  end

  test "should destroy specificity" do
    assert_difference('Specificity.count', -1) do
      delete :destroy, :id => @specificity
    end

    assert_redirected_to specificities_path
  end
end
