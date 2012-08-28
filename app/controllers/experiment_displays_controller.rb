class ExperimentDisplaysController < ApplicationController
  # GET /experiment_displays
  # GET /experiment_displays.json
  def index
    @experiment_displays = ExperimentDisplay.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @experiment_displays }
    end
  end

  # GET /experiment_displays/1
  # GET /experiment_displays/1.json
  def show
    @experiment_display = ExperimentDisplay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @experiment_display }
    end
  end

  # GET /experiment_displays/new
  # GET /experiment_displays/new.json
  def new
    @experiment_display = ExperimentDisplay.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @experiment_display }
    end
  end

  # GET /experiment_displays/1/edit
  def edit
    @experiment_display = ExperimentDisplay.find(params[:id])
  end

  # POST /experiment_displays
  # POST /experiment_displays.json
  def create
    @experiment_display = ExperimentDisplay.new(params[:experiment_display])

    respond_to do |format|
      if @experiment_display.save
        format.html { redirect_to @experiment_display, :notice => 'Experiment display was successfully created.' }
        format.json { render :json => @experiment_display, :status => :created, :location => @experiment_display }
      else
        format.html { render :action => "new" }
        format.json { render :json => @experiment_display.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /experiment_displays/1
  # PUT /experiment_displays/1.json
  def update
    @experiment_display = ExperimentDisplay.find(params[:id])

    respond_to do |format|
      if @experiment_display.update_attributes(params[:experiment_display])
        format.html { redirect_to @experiment_display, :notice => 'Experiment display was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @experiment_display.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /experiment_displays/1
  # DELETE /experiment_displays/1.json
  def destroy
    @experiment_display = ExperimentDisplay.find(params[:id])
    @experiment_display.destroy

    respond_to do |format|
      format.html { redirect_to experiment_displays_url }
      format.json { head :no_content }
    end
  end
end
