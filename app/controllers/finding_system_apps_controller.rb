class FindingSystemAppsController < ApplicationController
  # GET /finding_system_apps
  # GET /finding_system_apps.json
  def index
    @finding_system_apps = FindingSystemApp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finding_system_apps }
    end
  end

  # GET /finding_system_apps/1
  # GET /finding_system_apps/1.json
  def show
    @finding_system_app = FindingSystemApp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finding_system_app }
    end
  end

  # GET /finding_system_apps/new
  # GET /finding_system_apps/new.json
  def new
    @finding_system_app = FindingSystemApp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finding_system_app }
    end
  end

  # GET /finding_system_apps/1/edit
  def edit
    @finding_system_app = FindingSystemApp.find(params[:id])
  end

  # POST /finding_system_apps
  # POST /finding_system_apps.json
  def create
    @finding_system_app = FindingSystemApp.new(params[:finding_system_app])

    respond_to do |format|
      if @finding_system_app.save
        format.html { redirect_to @finding_system_app, notice: 'Finding system app was successfully created.' }
        format.json { render json: @finding_system_app, status: :created, location: @finding_system_app }
      else
        format.html { render action: "new" }
        format.json { render json: @finding_system_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finding_system_apps/1
  # PUT /finding_system_apps/1.json
  def update
    @finding_system_app = FindingSystemApp.find(params[:id])

    respond_to do |format|
      if @finding_system_app.update_attributes(params[:finding_system_app])
        format.html { redirect_to @finding_system_app, notice: 'Finding system app was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finding_system_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finding_system_apps/1
  # DELETE /finding_system_apps/1.json
  def destroy
    @finding_system_app = FindingSystemApp.find(params[:id])
    @finding_system_app.destroy

    respond_to do |format|
      format.html { redirect_to finding_system_apps_url }
      format.json { head :no_content }
    end
  end
end
