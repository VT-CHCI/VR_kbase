require 'test_helper'

class FindingIndyVariablesControllerTest < ActionController::TestCase
  setup do
    @finding_indy_variable = finding_indy_variables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finding_indy_variables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finding_indy_variable" do
    assert_difference('FindingIndyVariable.count') do
      post :create, finding_indy_variable: {  }
    end

    assert_redirected_to finding_indy_variable_path(assigns(:finding_indy_variable))
  end

  test "should show finding_indy_variable" do
    get :show, id: @finding_indy_variable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finding_indy_variable
    assert_response :success
  end

  test "should update finding_indy_variable" do
    put :update, id: @finding_indy_variable, finding_indy_variable: {  }
    assert_redirected_to finding_indy_variable_path(assigns(:finding_indy_variable))
  end

  test "should destroy finding_indy_variable" do
    assert_difference('FindingIndyVariable.count', -1) do
      delete :destroy, id: @finding_indy_variable
    end

    assert_redirected_to finding_indy_variables_path
  end
end
