require 'test_helper'

class BiomechanicalSymmetriesControllerTest < ActionController::TestCase
  setup do
    @biomechanical_symmetry = biomechanical_symmetries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:biomechanical_symmetries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create biomechanical_symmetry" do
    assert_difference('BiomechanicalSymmetry.count') do
      post :create, biomechanical_symmetry: { component: @biomechanical_symmetry.component }
    end

    assert_redirected_to biomechanical_symmetry_path(assigns(:biomechanical_symmetry))
  end

  test "should show biomechanical_symmetry" do
    get :show, id: @biomechanical_symmetry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @biomechanical_symmetry
    assert_response :success
  end

  test "should update biomechanical_symmetry" do
    put :update, id: @biomechanical_symmetry, biomechanical_symmetry: { component: @biomechanical_symmetry.component }
    assert_redirected_to biomechanical_symmetry_path(assigns(:biomechanical_symmetry))
  end

  test "should destroy biomechanical_symmetry" do
    assert_difference('BiomechanicalSymmetry.count', -1) do
      delete :destroy, id: @biomechanical_symmetry
    end

    assert_redirected_to biomechanical_symmetries_path
  end
end
