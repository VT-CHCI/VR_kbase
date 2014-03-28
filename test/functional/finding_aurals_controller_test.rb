require 'test_helper'

class FindingAuralsControllerTest < ActionController::TestCase
  setup do
    @finding_aural = finding_aurals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finding_aurals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finding_aural" do
    assert_difference('FindingAural.count') do
      post :create, finding_aural: {  }
    end

    assert_redirected_to finding_aural_path(assigns(:finding_aural))
  end

  test "should show finding_aural" do
    get :show, id: @finding_aural
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finding_aural
    assert_response :success
  end

  test "should update finding_aural" do
    put :update, id: @finding_aural, finding_aural: {  }
    assert_redirected_to finding_aural_path(assigns(:finding_aural))
  end

  test "should destroy finding_aural" do
    assert_difference('FindingAural.count', -1) do
      delete :destroy, id: @finding_aural
    end

    assert_redirected_to finding_aurals_path
  end
end
