require 'test_helper'

class HapticFidelitiesControllerTest < ActionController::TestCase
  setup do
    @haptic_fidelity = haptic_fidelities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:haptic_fidelities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create haptic_fidelity" do
    assert_difference('HapticFidelity.count') do
      post :create, haptic_fidelity: { component: @haptic_fidelity.component }
    end

    assert_redirected_to haptic_fidelity_path(assigns(:haptic_fidelity))
  end

  test "should show haptic_fidelity" do
    get :show, id: @haptic_fidelity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @haptic_fidelity
    assert_response :success
  end

  test "should update haptic_fidelity" do
    put :update, id: @haptic_fidelity, haptic_fidelity: { component: @haptic_fidelity.component }
    assert_redirected_to haptic_fidelity_path(assigns(:haptic_fidelity))
  end

  test "should destroy haptic_fidelity" do
    assert_difference('HapticFidelity.count', -1) do
      delete :destroy, id: @haptic_fidelity
    end

    assert_redirected_to haptic_fidelities_path
  end
end
