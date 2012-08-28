require 'test_helper'

class ExperimentGendersControllerTest < ActionController::TestCase
  setup do
    @experiment_gender = experiment_genders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiment_genders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiment_gender" do
    assert_difference('ExperimentGender.count') do
      post :create, :experiment_gender => {  }
    end

    assert_redirected_to experiment_gender_path(assigns(:experiment_gender))
  end

  test "should show experiment_gender" do
    get :show, :id => @experiment_gender
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @experiment_gender
    assert_response :success
  end

  test "should update experiment_gender" do
    put :update, :id => @experiment_gender, :experiment_gender => {  }
    assert_redirected_to experiment_gender_path(assigns(:experiment_gender))
  end

  test "should destroy experiment_gender" do
    assert_difference('ExperimentGender.count', -1) do
      delete :destroy, :id => @experiment_gender
    end

    assert_redirected_to experiment_genders_path
  end
end
