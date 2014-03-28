require 'test_helper'

class FindingVisualsControllerTest < ActionController::TestCase
  setup do
    @finding_visual = finding_visuals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finding_visuals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finding_visual" do
    assert_difference('FindingVisual.count') do
      post :create, finding_visual: {  }
    end

    assert_redirected_to finding_visual_path(assigns(:finding_visual))
  end

  test "should show finding_visual" do
    get :show, id: @finding_visual
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finding_visual
    assert_response :success
  end

  test "should update finding_visual" do
    put :update, id: @finding_visual, finding_visual: {  }
    assert_redirected_to finding_visual_path(assigns(:finding_visual))
  end

  test "should destroy finding_visual" do
    assert_difference('FindingVisual.count', -1) do
      delete :destroy, id: @finding_visual
    end

    assert_redirected_to finding_visuals_path
  end
end
