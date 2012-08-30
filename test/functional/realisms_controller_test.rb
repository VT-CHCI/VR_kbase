require 'test_helper'

class RealismsControllerTest < ActionController::TestCase
  setup do
    @realism = realisms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:realisms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create realism" do
    assert_difference('Realism.count') do
      post :create, :realism => { :level => @realism.level }
    end

    assert_redirected_to realism_path(assigns(:realism))
  end

  test "should show realism" do
    get :show, :id => @realism
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @realism
    assert_response :success
  end

  test "should update realism" do
    put :update, :id => @realism, :realism => { :level => @realism.level }
    assert_redirected_to realism_path(assigns(:realism))
  end

  test "should destroy realism" do
    assert_difference('Realism.count', -1) do
      delete :destroy, :id => @realism
    end

    assert_redirected_to realisms_path
  end
end
