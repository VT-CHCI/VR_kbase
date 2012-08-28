class ExperimentComponentsController < ApplicationController
  # GET /experiment_components
  # GET /experiment_components.json
  def index
    @experiment_components = ExperimentComponent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @experiment_components }
    end
  end

  # GET /experiment_components/1
  # GET /experiment_components/1.json
  def show
    @experiment_component = ExperimentComponent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @experiment_component }
    end
  end

  # GET /experiment_components/new
  # GET /experiment_components/new.json
  def new
    @experiment_component = ExperimentComponent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @experiment_component }
    end
  end

  # GET /experiment_components/1/edit
  def edit
    @experiment_component = ExperimentComponent.find(params[:id])
  end

  # POST /experiment_components
  # POST /experiment_components.json
  def create
    @experiment_component = ExperimentComponent.new(params[:experiment_component])

    respond_to do |format|
      if @experiment_component.save
        format.html { redirect_to @experiment_component, :notice => 'Experiment component was successfully created.' }
        format.json { render :json => @experiment_component, :status => :created, :location => @experiment_component }
      else
        format.html { render :action => "new" }
        format.json { render :json => @experiment_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /experiment_components/1
  # PUT /experiment_components/1.json
  def update
    @experiment_component = ExperimentComponent.find(params[:id])

    respond_to do |format|
      if @experiment_component.update_attributes(params[:experiment_component])
        format.html { redirect_to @experiment_component, :notice => 'Experiment component was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @experiment_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /experiment_components/1
  # DELETE /experiment_components/1.json
  def destroy
    @experiment_component = ExperimentComponent.find(params[:id])
    @experiment_component.destroy

    respond_to do |format|
      format.html { redirect_to experiment_components_url }
      format.json { head :no_content }
    end
  end
end
