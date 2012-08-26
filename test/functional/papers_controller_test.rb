require 'test_helper'

class PapersControllerTest < ActionController::TestCase
  setup do
    @paper = papers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:papers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paper" do
    assert_difference('Paper.count') do
      post :create, :paper => { :doi => @paper.doi, :experiments => @paper.experiments, :num_pages => @paper.num_pages, :num_views => @paper.num_views, :paper_url => @paper.paper_url, :start_page => @paper.start_page, :title => @paper.title, :volume => @paper.volume, :year => @paper.year }
    end

    assert_redirected_to paper_path(assigns(:paper))
  end

  test "should show paper" do
    get :show, :id => @paper
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @paper
    assert_response :success
  end

  test "should update paper" do
    put :update, :id => @paper, :paper => { :doi => @paper.doi, :experiments => @paper.experiments, :num_pages => @paper.num_pages, :num_views => @paper.num_views, :paper_url => @paper.paper_url, :start_page => @paper.start_page, :title => @paper.title, :volume => @paper.volume, :year => @paper.year }
    assert_redirected_to paper_path(assigns(:paper))
  end

  test "should destroy paper" do
    assert_difference('Paper.count', -1) do
      delete :destroy, :id => @paper
    end

    assert_redirected_to papers_path
  end
end
