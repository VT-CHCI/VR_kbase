require 'test_helper'

class AuthorPapersControllerTest < ActionController::TestCase
  setup do
    @author_paper = author_papers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:author_papers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create author_paper" do
    assert_difference('AuthorPaper.count') do
      post :create, :author_paper => {  }
    end

    assert_redirected_to author_paper_path(assigns(:author_paper))
  end

  test "should show author_paper" do
    get :show, :id => @author_paper
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @author_paper
    assert_response :success
  end

  test "should update author_paper" do
    put :update, :id => @author_paper, :author_paper => {  }
    assert_redirected_to author_paper_path(assigns(:author_paper))
  end

  test "should destroy author_paper" do
    assert_difference('AuthorPaper.count', -1) do
      delete :destroy, :id => @author_paper
    end

    assert_redirected_to author_papers_path
  end
end
