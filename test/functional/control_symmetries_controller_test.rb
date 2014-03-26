require 'test_helper'

class ControlSymmetriesControllerTest < ActionController::TestCase
  setup do
    @control_symmetry = control_symmetries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:control_symmetries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create control_symmetry" do
    assert_difference('ControlSymmetry.count') do
      post :create, control_symmetry: { component: @control_symmetry.component }
    end

    assert_redirected_to control_symmetry_path(assigns(:control_symmetry))
  end

  test "should show control_symmetry" do
    get :show, id: @control_symmetry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @control_symmetry
    assert_response :success
  end

  test "should update control_symmetry" do
    put :update, id: @control_symmetry, control_symmetry: { component: @control_symmetry.component }
    assert_redirected_to control_symmetry_path(assigns(:control_symmetry))
  end

  test "should destroy control_symmetry" do
    assert_difference('ControlSymmetry.count', -1) do
      delete :destroy, id: @control_symmetry
    end

    assert_redirected_to control_symmetries_path
  end
end
