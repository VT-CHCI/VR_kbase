require 'test_helper'

class ExperimentDisplaysControllerTest < ActionController::TestCase
  setup do
    @experiment_display = experiment_displays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiment_displays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiment_display" do
    assert_difference('ExperimentDisplay.count') do
      post :create, :experiment_display => {  }
    end

    assert_redirected_to experiment_display_path(assigns(:experiment_display))
  end

  test "should show experiment_display" do
    get :show, :id => @experiment_display
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @experiment_display
    assert_response :success
  end

  test "should update experiment_display" do
    put :update, :id => @experiment_display, :experiment_display => {  }
    assert_redirected_to experiment_display_path(assigns(:experiment_display))
  end

  test "should destroy experiment_display" do
    assert_difference('ExperimentDisplay.count', -1) do
      delete :destroy, :id => @experiment_display
    end

    assert_redirected_to experiment_displays_path
  end
end
