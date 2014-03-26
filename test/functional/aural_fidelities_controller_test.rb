require 'test_helper'

class AuralFidelitiesControllerTest < ActionController::TestCase
  setup do
    @aural_fidelity = aural_fidelities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aural_fidelities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aural_fidelity" do
    assert_difference('AuralFidelity.count') do
      post :create, aural_fidelity: { component: @aural_fidelity.component }
    end

    assert_redirected_to aural_fidelity_path(assigns(:aural_fidelity))
  end

  test "should show aural_fidelity" do
    get :show, id: @aural_fidelity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aural_fidelity
    assert_response :success
  end

  test "should update aural_fidelity" do
    put :update, id: @aural_fidelity, aural_fidelity: { component: @aural_fidelity.component }
    assert_redirected_to aural_fidelity_path(assigns(:aural_fidelity))
  end

  test "should destroy aural_fidelity" do
    assert_difference('AuralFidelity.count', -1) do
      delete :destroy, id: @aural_fidelity
    end

    assert_redirected_to aural_fidelities_path
  end
end
