require 'test_helper'

class UserAuthorsControllerTest < ActionController::TestCase
  setup do
    @user_author = user_authors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_authors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_author" do
    assert_difference('UserAuthor.count') do
      post :create, user_author: {  }
    end

    assert_redirected_to user_author_path(assigns(:user_author))
  end

  test "should show user_author" do
    get :show, id: @user_author
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_author
    assert_response :success
  end

  test "should update user_author" do
    put :update, id: @user_author, user_author: {  }
    assert_redirected_to user_author_path(assigns(:user_author))
  end

  test "should destroy user_author" do
    assert_difference('UserAuthor.count', -1) do
      delete :destroy, id: @user_author
    end

    assert_redirected_to user_authors_path
  end
end
