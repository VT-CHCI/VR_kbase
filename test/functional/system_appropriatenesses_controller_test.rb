require 'test_helper'

class SystemAppropriatenessesControllerTest < ActionController::TestCase
  setup do
    @system_appropriateness = system_appropriatenesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:system_appropriatenesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create system_appropriateness" do
    assert_difference('SystemAppropriateness.count') do
      post :create, system_appropriateness: { component: @system_appropriateness.component }
    end

    assert_redirected_to system_appropriateness_path(assigns(:system_appropriateness))
  end

  test "should show system_appropriateness" do
    get :show, id: @system_appropriateness
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @system_appropriateness
    assert_response :success
  end

  test "should update system_appropriateness" do
    put :update, id: @system_appropriateness, system_appropriateness: { component: @system_appropriateness.component }
    assert_redirected_to system_appropriateness_path(assigns(:system_appropriateness))
  end

  test "should destroy system_appropriateness" do
    assert_difference('SystemAppropriateness.count', -1) do
      delete :destroy, id: @system_appropriateness
    end

    assert_redirected_to system_appropriatenesses_path
  end
end
