class TaskScalesController < ApplicationController
  # GET /task_scales
  # GET /task_scales.json
  def index
    @task_scales = TaskScale.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @task_scales }
    end
  end

  # GET /task_scales/1
  # GET /task_scales/1.json
  def show
    @task_scale = TaskScale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @task_scale }
    end
  end

  # GET /task_scales/new
  # GET /task_scales/new.json
  def new
    @task_scale = TaskScale.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @task_scale }
    end
  end

  # GET /task_scales/1/edit
  def edit
    @task_scale = TaskScale.find(params[:id])
  end

  # POST /task_scales
  # POST /task_scales.json
  def create
    @task_scale = TaskScale.new(params[:task_scale])

    respond_to do |format|
      if @task_scale.save
        format.html { redirect_to @task_scale, :notice => 'Task scale was successfully created.' }
        format.json { render :json => @task_scale, :status => :created, :location => @task_scale }
      else
        format.html { render :action => "new" }
        format.json { render :json => @task_scale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /task_scales/1
  # PUT /task_scales/1.json
  def update
    @task_scale = TaskScale.find(params[:id])

    respond_to do |format|
      if @task_scale.update_attributes(params[:task_scale])
        format.html { redirect_to @task_scale, :notice => 'Task scale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @task_scale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /task_scales/1
  # DELETE /task_scales/1.json
  def destroy
    @task_scale = TaskScale.find(params[:id])
    @task_scale.destroy

    respond_to do |format|
      format.html { redirect_to task_scales_url }
      format.json { head :no_content }
    end
  end
end
