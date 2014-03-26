class ExperimentSystemAppsController < ApplicationController
  # GET /experiment_system_apps
  # GET /experiment_system_apps.json
  def index
    @experiment_system_apps = ExperimentSystemApp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @experiment_system_apps }
    end
  end

  # GET /experiment_system_apps/1
  # GET /experiment_system_apps/1.json
  def show
    @experiment_system_app = ExperimentSystemApp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @experiment_system_app }
    end
  end

  # GET /experiment_system_apps/new
  # GET /experiment_system_apps/new.json
  def new
    @experiment_system_app = ExperimentSystemApp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @experiment_system_app }
    end
  end

  # GET /experiment_system_apps/1/edit
  def edit
    @experiment_system_app = ExperimentSystemApp.find(params[:id])
  end

  # POST /experiment_system_apps
  # POST /experiment_system_apps.json
  def create
    @experiment_system_app = ExperimentSystemApp.new(params[:experiment_system_app])

    respond_to do |format|
      if @experiment_system_app.save
        format.html { redirect_to @experiment_system_app, notice: 'Experiment system app was successfully created.' }
        format.json { render json: @experiment_system_app, status: :created, location: @experiment_system_app }
      else
        format.html { render action: "new" }
        format.json { render json: @experiment_system_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /experiment_system_apps/1
  # PUT /experiment_system_apps/1.json
  def update
    @experiment_system_app = ExperimentSystemApp.find(params[:id])

    respond_to do |format|
      if @experiment_system_app.update_attributes(params[:experiment_system_app])
        format.html { redirect_to @experiment_system_app, notice: 'Experiment system app was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @experiment_system_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiment_system_apps/1
  # DELETE /experiment_system_apps/1.json
  def destroy
    @experiment_system_app = ExperimentSystemApp.find(params[:id])
    @experiment_system_app.destroy

    respond_to do |format|
      format.html { redirect_to experiment_system_apps_url }
      format.json { head :no_content }
    end
  end
end
