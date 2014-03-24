require 'test_helper'

class UserPapersControllerTest < ActionController::TestCase
  setup do
    @user_paper = user_papers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_papers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_paper" do
    assert_difference('UserPaper.count') do
      post :create, user_paper: {  }
    end

    assert_redirected_to user_paper_path(assigns(:user_paper))
  end

  test "should show user_paper" do
    get :show, id: @user_paper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_paper
    assert_response :success
  end

  test "should update user_paper" do
    put :update, id: @user_paper, user_paper: {  }
    assert_redirected_to user_paper_path(assigns(:user_paper))
  end

  test "should destroy user_paper" do
    assert_difference('UserPaper.count', -1) do
      delete :destroy, id: @user_paper
    end

    assert_redirected_to user_papers_path
  end
end
