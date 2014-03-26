require 'test_helper'

class ExperimentIndyVariablesControllerTest < ActionController::TestCase
  setup do
    @experiment_indy_variable = experiment_indy_variables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiment_indy_variables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiment_indy_variable" do
    assert_difference('ExperimentIndyVariable.count') do
      post :create, experiment_indy_variable: { desc: @experiment_indy_variable.desc }
    end

    assert_redirected_to experiment_indy_variable_path(assigns(:experiment_indy_variable))
  end

  test "should show experiment_indy_variable" do
    get :show, id: @experiment_indy_variable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experiment_indy_variable
    assert_response :success
  end

  test "should update experiment_indy_variable" do
    put :update, id: @experiment_indy_variable, experiment_indy_variable: { desc: @experiment_indy_variable.desc }
    assert_redirected_to experiment_indy_variable_path(assigns(:experiment_indy_variable))
  end

  test "should destroy experiment_indy_variable" do
    assert_difference('ExperimentIndyVariable.count', -1) do
      delete :destroy, id: @experiment_indy_variable
    end

    assert_redirected_to experiment_indy_variables_path
  end
end
