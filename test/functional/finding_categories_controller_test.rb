require 'test_helper'

class FindingCategoriesControllerTest < ActionController::TestCase
  setup do
    @finding_category = finding_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finding_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finding_category" do
    assert_difference('FindingCategory.count') do
      post :create, finding_category: {  }
    end

    assert_redirected_to finding_category_path(assigns(:finding_category))
  end

  test "should show finding_category" do
    get :show, id: @finding_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finding_category
    assert_response :success
  end

  test "should update finding_category" do
    put :update, id: @finding_category, finding_category: {  }
    assert_redirected_to finding_category_path(assigns(:finding_category))
  end

  test "should destroy finding_category" do
    assert_difference('FindingCategory.count', -1) do
      delete :destroy, id: @finding_category
    end

    assert_redirected_to finding_categories_path
  end
end
