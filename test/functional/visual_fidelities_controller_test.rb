require 'test_helper'

class VisualFidelitiesControllerTest < ActionController::TestCase
  setup do
    @visual_fidelity = visual_fidelities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visual_fidelities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visual_fidelity" do
    assert_difference('VisualFidelity.count') do
      post :create, visual_fidelity: { component: @visual_fidelity.component }
    end

    assert_redirected_to visual_fidelity_path(assigns(:visual_fidelity))
  end

  test "should show visual_fidelity" do
    get :show, id: @visual_fidelity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visual_fidelity
    assert_response :success
  end

  test "should update visual_fidelity" do
    put :update, id: @visual_fidelity, visual_fidelity: { component: @visual_fidelity.component }
    assert_redirected_to visual_fidelity_path(assigns(:visual_fidelity))
  end

  test "should destroy visual_fidelity" do
    assert_difference('VisualFidelity.count', -1) do
      delete :destroy, id: @visual_fidelity
    end

    assert_redirected_to visual_fidelities_path
  end
end
