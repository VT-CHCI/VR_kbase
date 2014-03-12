require 'test_helper'

class ExperimentAuralsControllerTest < ActionController::TestCase
  setup do
    @experiment_aural = experiment_aurals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiment_aurals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiment_aural" do
    assert_difference('ExperimentAural.count') do
      post :create, experiment_aural: { desc: @experiment_aural.desc }
    end

    assert_redirected_to experiment_aural_path(assigns(:experiment_aural))
  end

  test "should show experiment_aural" do
    get :show, id: @experiment_aural
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experiment_aural
    assert_response :success
  end

  test "should update experiment_aural" do
    put :update, id: @experiment_aural, experiment_aural: { desc: @experiment_aural.desc }
    assert_redirected_to experiment_aural_path(assigns(:experiment_aural))
  end

  test "should destroy experiment_aural" do
    assert_difference('ExperimentAural.count', -1) do
      delete :destroy, id: @experiment_aural
    end

    assert_redirected_to experiment_aurals_path
  end
end
