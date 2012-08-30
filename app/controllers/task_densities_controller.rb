class TaskDensitiesController < ApplicationController
  # GET /task_densities
  # GET /task_densities.json
  def index
    @task_densities = TaskDensity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @task_densities }
    end
  end

  # GET /task_densities/1
  # GET /task_densities/1.json
  def show
    @task_density = TaskDensity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @task_density }
    end
  end

  # GET /task_densities/new
  # GET /task_densities/new.json
  def new
    @task_density = TaskDensity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @task_density }
    end
  end

  # GET /task_densities/1/edit
  def edit
    @task_density = TaskDensity.find(params[:id])
  end

  # POST /task_densities
  # POST /task_densities.json
  def create
    @task_density = TaskDensity.new(params[:task_density])

    respond_to do |format|
      if @task_density.save
        format.html { redirect_to @task_density, :notice => 'Task density was successfully created.' }
        format.json { render :json => @task_density, :status => :created, :location => @task_density }
      else
        format.html { render :action => "new" }
        format.json { render :json => @task_density.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /task_densities/1
  # PUT /task_densities/1.json
  def update
    @task_density = TaskDensity.find(params[:id])

    respond_to do |format|
      if @task_density.update_attributes(params[:task_density])
        format.html { redirect_to @task_density, :notice => 'Task density was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @task_density.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /task_densities/1
  # DELETE /task_densities/1.json
  def destroy
    @task_density = TaskDensity.find(params[:id])
    @task_density.destroy

    respond_to do |format|
      format.html { redirect_to task_densities_url }
      format.json { head :no_content }
    end
  end
end
