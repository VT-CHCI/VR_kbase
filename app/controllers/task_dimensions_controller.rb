class TaskDimensionsController < ApplicationController
  # GET /task_dimensions
  # GET /task_dimensions.json
  def index
    @task_dimensions = TaskDimension.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @task_dimensions }
    end
  end

  # GET /task_dimensions/1
  # GET /task_dimensions/1.json
  def show
    @task_dimension = TaskDimension.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @task_dimension }
    end
  end

  # GET /task_dimensions/new
  # GET /task_dimensions/new.json
  def new
    @task_dimension = TaskDimension.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @task_dimension }
    end
  end

  # GET /task_dimensions/1/edit
  def edit
    @task_dimension = TaskDimension.find(params[:id])
  end

  # POST /task_dimensions
  # POST /task_dimensions.json
  def create
    @task_dimension = TaskDimension.new(params[:task_dimension])

    respond_to do |format|
      if @task_dimension.save
        format.html { redirect_to @task_dimension, :notice => 'Task dimension was successfully created.' }
        format.json { render :json => @task_dimension, :status => :created, :location => @task_dimension }
      else
        format.html { render :action => "new" }
        format.json { render :json => @task_dimension.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /task_dimensions/1
  # PUT /task_dimensions/1.json
  def update
    @task_dimension = TaskDimension.find(params[:id])

    respond_to do |format|
      if @task_dimension.update_attributes(params[:task_dimension])
        format.html { redirect_to @task_dimension, :notice => 'Task dimension was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @task_dimension.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /task_dimensions/1
  # DELETE /task_dimensions/1.json
  def destroy
    @task_dimension = TaskDimension.find(params[:id])
    @task_dimension.destroy

    respond_to do |format|
      format.html { redirect_to task_dimensions_url }
      format.json { head :no_content }
    end
  end
end
