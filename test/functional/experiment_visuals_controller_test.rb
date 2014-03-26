require 'test_helper'

class ExperimentVisualsControllerTest < ActionController::TestCase
  setup do
    @experiment_visual = experiment_visuals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiment_visuals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiment_visual" do
    assert_difference('ExperimentVisual.count') do
      post :create, experiment_visual: { desc: @experiment_visual.desc }
    end

    assert_redirected_to experiment_visual_path(assigns(:experiment_visual))
  end

  test "should show experiment_visual" do
    get :show, id: @experiment_visual
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experiment_visual
    assert_response :success
  end

  test "should update experiment_visual" do
    put :update, id: @experiment_visual, experiment_visual: { desc: @experiment_visual.desc }
    assert_redirected_to experiment_visual_path(assigns(:experiment_visual))
  end

  test "should destroy experiment_visual" do
    assert_difference('ExperimentVisual.count', -1) do
      delete :destroy, id: @experiment_visual
    end

    assert_redirected_to experiment_visuals_path
  end
end
