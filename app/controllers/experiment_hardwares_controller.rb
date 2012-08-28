class ExperimentHardwaresController < ApplicationController
  # GET /experiment_hardwares
  # GET /experiment_hardwares.json
  def index
    @experiment_hardwares = ExperimentHardware.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @experiment_hardwares }
    end
  end

  # GET /experiment_hardwares/1
  # GET /experiment_hardwares/1.json
  def show
    @experiment_hardware = ExperimentHardware.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @experiment_hardware }
    end
  end

  # GET /experiment_hardwares/new
  # GET /experiment_hardwares/new.json
  def new
    @experiment_hardware = ExperimentHardware.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @experiment_hardware }
    end
  end

  # GET /experiment_hardwares/1/edit
  def edit
    @experiment_hardware = ExperimentHardware.find(params[:id])
  end

  # POST /experiment_hardwares
  # POST /experiment_hardwares.json
  def create
    @experiment_hardware = ExperimentHardware.new(params[:experiment_hardware])

    respond_to do |format|
      if @experiment_hardware.save
        format.html { redirect_to @experiment_hardware, :notice => 'Experiment hardware was successfully created.' }
        format.json { render :json => @experiment_hardware, :status => :created, :location => @experiment_hardware }
      else
        format.html { render :action => "new" }
        format.json { render :json => @experiment_hardware.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /experiment_hardwares/1
  # PUT /experiment_hardwares/1.json
  def update
    @experiment_hardware = ExperimentHardware.find(params[:id])

    respond_to do |format|
      if @experiment_hardware.update_attributes(params[:experiment_hardware])
        format.html { redirect_to @experiment_hardware, :notice => 'Experiment hardware was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @experiment_hardware.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /experiment_hardwares/1
  # DELETE /experiment_hardwares/1.json
  def destroy
    @experiment_hardware = ExperimentHardware.find(params[:id])
    @experiment_hardware.destroy

    respond_to do |format|
      format.html { redirect_to experiment_hardwares_url }
      format.json { head :no_content }
    end
  end
end
