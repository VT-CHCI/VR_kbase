class TaskMetricsController < ApplicationController
  # GET /task_metrics
  # GET /task_metrics.json
  def index
    @task_metrics = TaskMetric.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @task_metrics }
    end
  end

  # GET /task_metrics/1
  # GET /task_metrics/1.json
  def show
    @task_metric = TaskMetric.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @task_metric }
    end
  end

  # GET /task_metrics/new
  # GET /task_metrics/new.json
  def new
    @task_metric = TaskMetric.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @task_metric }
    end
  end

  # GET /task_metrics/1/edit
  def edit
    @task_metric = TaskMetric.find(params[:id])
  end

  # POST /task_metrics
  # POST /task_metrics.json
  def create
    @task_metric = TaskMetric.new(params[:task_metric])

    respond_to do |format|
      if @task_metric.save
        format.html { redirect_to @task_metric, :notice => 'Task metric was successfully created.' }
        format.json { render :json => @task_metric, :status => :created, :location => @task_metric }
      else
        format.html { render :action => "new" }
        format.json { render :json => @task_metric.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /task_metrics/1
  # PUT /task_metrics/1.json
  def update
    @task_metric = TaskMetric.find(params[:id])

    respond_to do |format|
      if @task_metric.update_attributes(params[:task_metric])
        format.html { redirect_to @task_metric, :notice => 'Task metric was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @task_metric.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /task_metrics/1
  # DELETE /task_metrics/1.json
  def destroy
    @task_metric = TaskMetric.find(params[:id])
    @task_metric.destroy

    respond_to do |format|
      format.html { redirect_to task_metrics_url }
      format.json { head :no_content }
    end
  end
end
