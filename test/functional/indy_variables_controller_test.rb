require 'test_helper'

class IndyVariablesControllerTest < ActionController::TestCase
  setup do
    @indy_variable = indy_variables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indy_variables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indy_variable" do
    assert_difference('IndyVariable.count') do
      post :create, indy_variable: { variable: @indy_variable.variable }
    end

    assert_redirected_to indy_variable_path(assigns(:indy_variable))
  end

  test "should show indy_variable" do
    get :show, id: @indy_variable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @indy_variable
    assert_response :success
  end

  test "should update indy_variable" do
    put :update, id: @indy_variable, indy_variable: { variable: @indy_variable.variable }
    assert_redirected_to indy_variable_path(assigns(:indy_variable))
  end

  test "should destroy indy_variable" do
    assert_difference('IndyVariable.count', -1) do
      delete :destroy, id: @indy_variable
    end

    assert_redirected_to indy_variables_path
  end
end
