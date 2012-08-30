require 'test_helper'

class DensitiesControllerTest < ActionController::TestCase
  setup do
    @density = densities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:densities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create density" do
    assert_difference('Density.count') do
      post :create, :density => { :level => @density.level }
    end

    assert_redirected_to density_path(assigns(:density))
  end

  test "should show density" do
    get :show, :id => @density
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @density
    assert_response :success
  end

  test "should update density" do
    put :update, :id => @density, :density => { :level => @density.level }
    assert_redirected_to density_path(assigns(:density))
  end

  test "should destroy density" do
    assert_difference('Density.count', -1) do
      delete :destroy, :id => @density
    end

    assert_redirected_to densities_path
  end
end
