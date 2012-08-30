require 'test_helper'

class FindingRelationshipsControllerTest < ActionController::TestCase
  setup do
    @finding_relationship = finding_relationships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finding_relationships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finding_relationship" do
    assert_difference('FindingRelationship.count') do
      post :create, :finding_relationship => {  }
    end

    assert_redirected_to finding_relationship_path(assigns(:finding_relationship))
  end

  test "should show finding_relationship" do
    get :show, :id => @finding_relationship
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @finding_relationship
    assert_response :success
  end

  test "should update finding_relationship" do
    put :update, :id => @finding_relationship, :finding_relationship => {  }
    assert_redirected_to finding_relationship_path(assigns(:finding_relationship))
  end

  test "should destroy finding_relationship" do
    assert_difference('FindingRelationship.count', -1) do
      delete :destroy, :id => @finding_relationship
    end

    assert_redirected_to finding_relationships_path
  end
end
