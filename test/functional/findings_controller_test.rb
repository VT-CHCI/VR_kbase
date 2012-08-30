require 'test_helper'

class FindingsControllerTest < ActionController::TestCase
  setup do
    @finding = findings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:findings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finding" do
    assert_difference('Finding.count') do
      post :create, :finding => { :issue => @finding.issue, :summary => @finding.summary, :title => @finding.title }
    end

    assert_redirected_to finding_path(assigns(:finding))
  end

  test "should show finding" do
    get :show, :id => @finding
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @finding
    assert_response :success
  end

  test "should update finding" do
    put :update, :id => @finding, :finding => { :issue => @finding.issue, :summary => @finding.summary, :title => @finding.title }
    assert_redirected_to finding_path(assigns(:finding))
  end

  test "should destroy finding" do
    assert_difference('Finding.count', -1) do
      delete :destroy, :id => @finding
    end

    assert_redirected_to findings_path
  end
end
