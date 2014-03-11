require 'test_helper'

class ExperimentBiomechanicalsControllerTest < ActionController::TestCase
  setup do
    @experiment_biomechanical = experiment_biomechanicals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiment_biomechanicals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiment_biomechanical" do
    assert_difference('ExperimentBiomechanical.count') do
      post :create, experiment_biomechanical: { desc: @experiment_biomechanical.desc }
    end

    assert_redirected_to experiment_biomechanical_path(assigns(:experiment_biomechanical))
  end

  test "should show experiment_biomechanical" do
    get :show, id: @experiment_biomechanical
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experiment_biomechanical
    assert_response :success
  end

  test "should update experiment_biomechanical" do
    put :update, id: @experiment_biomechanical, experiment_biomechanical: { desc: @experiment_biomechanical.desc }
    assert_redirected_to experiment_biomechanical_path(assigns(:experiment_biomechanical))
  end

  test "should destroy experiment_biomechanical" do
    assert_difference('ExperimentBiomechanical.count', -1) do
      delete :destroy, id: @experiment_biomechanical
    end

    assert_redirected_to experiment_biomechanicals_path
  end
end
