class TaskRealismsController < ApplicationController
  # GET /task_realisms
  # GET /task_realisms.json
  def index
    @task_realisms = TaskRealism.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @task_realisms }
    end
  end

  # GET /task_realisms/1
  # GET /task_realisms/1.json
  def show
    @task_realism = TaskRealism.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @task_realism }
    end
  end

  # GET /task_realisms/new
  # GET /task_realisms/new.json
  def new
    @task_realism = TaskRealism.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @task_realism }
    end
  end

  # GET /task_realisms/1/edit
  def edit
    @task_realism = TaskRealism.find(params[:id])
  end

  # POST /task_realisms
  # POST /task_realisms.json
  def create
    @task_realism = TaskRealism.new(params[:task_realism])

    respond_to do |format|
      if @task_realism.save
        format.html { redirect_to @task_realism, :notice => 'Task realism was successfully created.' }
        format.json { render :json => @task_realism, :status => :created, :location => @task_realism }
      else
        format.html { render :action => "new" }
        format.json { render :json => @task_realism.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /task_realisms/1
  # PUT /task_realisms/1.json
  def update
    @task_realism = TaskRealism.find(params[:id])

    respond_to do |format|
      if @task_realism.update_attributes(params[:task_realism])
        format.html { redirect_to @task_realism, :notice => 'Task realism was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @task_realism.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /task_realisms/1
  # DELETE /task_realisms/1.json
  def destroy
    @task_realism = TaskRealism.find(params[:id])
    @task_realism.destroy

    respond_to do |format|
      format.html { redirect_to task_realisms_url }
      format.json { head :no_content }
    end
  end
end
