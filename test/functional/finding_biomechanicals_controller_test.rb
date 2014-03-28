require 'test_helper'

class FindingBiomechanicalsControllerTest < ActionController::TestCase
  setup do
    @finding_biomechanical = finding_biomechanicals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finding_biomechanicals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finding_biomechanical" do
    assert_difference('FindingBiomechanical.count') do
      post :create, finding_biomechanical: {  }
    end

    assert_redirected_to finding_biomechanical_path(assigns(:finding_biomechanical))
  end

  test "should show finding_biomechanical" do
    get :show, id: @finding_biomechanical
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finding_biomechanical
    assert_response :success
  end

  test "should update finding_biomechanical" do
    put :update, id: @finding_biomechanical, finding_biomechanical: {  }
    assert_redirected_to finding_biomechanical_path(assigns(:finding_biomechanical))
  end

  test "should destroy finding_biomechanical" do
    assert_difference('FindingBiomechanical.count', -1) do
      delete :destroy, id: @finding_biomechanical
    end

    assert_redirected_to finding_biomechanicals_path
  end
end
