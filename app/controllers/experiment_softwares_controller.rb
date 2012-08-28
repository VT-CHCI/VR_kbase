class ExperimentSoftwaresController < ApplicationController
  # GET /experiment_softwares
  # GET /experiment_softwares.json
  def index
    @experiment_softwares = ExperimentSoftware.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @experiment_softwares }
    end
  end

  # GET /experiment_softwares/1
  # GET /experiment_softwares/1.json
  def show
    @experiment_software = ExperimentSoftware.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @experiment_software }
    end
  end

  # GET /experiment_softwares/new
  # GET /experiment_softwares/new.json
  def new
    @experiment_software = ExperimentSoftware.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @experiment_software }
    end
  end

  # GET /experiment_softwares/1/edit
  def edit
    @experiment_software = ExperimentSoftware.find(params[:id])
  end

  # POST /experiment_softwares
  # POST /experiment_softwares.json
  def create
    @experiment_software = ExperimentSoftware.new(params[:experiment_software])

    respond_to do |format|
      if @experiment_software.save
        format.html { redirect_to @experiment_software, :notice => 'Experiment software was successfully created.' }
        format.json { render :json => @experiment_software, :status => :created, :location => @experiment_software }
      else
        format.html { render :action => "new" }
        format.json { render :json => @experiment_software.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /experiment_softwares/1
  # PUT /experiment_softwares/1.json
  def update
    @experiment_software = ExperimentSoftware.find(params[:id])

    respond_to do |format|
      if @experiment_software.update_attributes(params[:experiment_software])
        format.html { redirect_to @experiment_software, :notice => 'Experiment software was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @experiment_software.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /experiment_softwares/1
  # DELETE /experiment_softwares/1.json
  def destroy
    @experiment_software = ExperimentSoftware.find(params[:id])
    @experiment_software.destroy

    respond_to do |format|
      format.html { redirect_to experiment_softwares_url }
      format.json { head :no_content }
    end
  end
end
