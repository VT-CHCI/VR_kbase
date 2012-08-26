require 'test_helper'

class ExperimentsControllerTest < ActionController::TestCase
  setup do
    @experiment = experiments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiment" do
    assert_difference('Experiment.count') do
      post :create, :experiment => { :comp_desc => @experiment.comp_desc, :constants => @experiment.constants, :exp_desc => @experiment.exp_desc, :other_vars => @experiment.other_vars, :part_age_max => @experiment.part_age_max, :part_age_min => @experiment.part_age_min, :part_background => @experiment.part_background, :part_num => @experiment.part_num, :system_desc => @experiment.system_desc, :tasks => @experiment.tasks, :title => @experiment.title }
    end

    assert_redirected_to experiment_path(assigns(:experiment))
  end

  test "should show experiment" do
    get :show, :id => @experiment
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @experiment
    assert_response :success
  end

  test "should update experiment" do
    put :update, :id => @experiment, :experiment => { :comp_desc => @experiment.comp_desc, :constants => @experiment.constants, :exp_desc => @experiment.exp_desc, :other_vars => @experiment.other_vars, :part_age_max => @experiment.part_age_max, :part_age_min => @experiment.part_age_min, :part_background => @experiment.part_background, :part_num => @experiment.part_num, :system_desc => @experiment.system_desc, :tasks => @experiment.tasks, :title => @experiment.title }
    assert_redirected_to experiment_path(assigns(:experiment))
  end

  test "should destroy experiment" do
    assert_difference('Experiment.count', -1) do
      delete :destroy, :id => @experiment
    end

    assert_redirected_to experiments_path
  end
end
