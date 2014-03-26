class ExperimentControlsController < ApplicationController
  # GET /experiment_controls
  # GET /experiment_controls.json
  def index
    @experiment_controls = ExperimentControl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @experiment_controls }
    end
  end

  # GET /experiment_controls/1
  # GET /experiment_controls/1.json
  def show
    @experiment_control = ExperimentControl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @experiment_control }
    end
  end

  # GET /experiment_controls/new
  # GET /experiment_controls/new.json
  def new
    @experiment_control = ExperimentControl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @experiment_control }
    end
  end

  # GET /experiment_controls/1/edit
  def edit
    @experiment_control = ExperimentControl.find(params[:id])
  end

  # POST /experiment_controls
  # POST /experiment_controls.json
  def create
    @experiment_control = ExperimentControl.new(params[:experiment_control])

    respond_to do |format|
      if @experiment_control.save
        format.html { redirect_to @experiment_control, notice: 'Experiment control was successfully created.' }
        format.json { render json: @experiment_control, status: :created, location: @experiment_control }
      else
        format.html { render action: "new" }
        format.json { render json: @experiment_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /experiment_controls/1
  # PUT /experiment_controls/1.json
  def update
    @experiment_control = ExperimentControl.find(params[:id])

    respond_to do |format|
      if @experiment_control.update_attributes(params[:experiment_control])
        format.html { redirect_to @experiment_control, notice: 'Experiment control was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @experiment_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiment_controls/1
  # DELETE /experiment_controls/1.json
  def destroy
    @experiment_control = ExperimentControl.find(params[:id])
    @experiment_control.destroy

    respond_to do |format|
      format.html { redirect_to experiment_controls_url }
      format.json { head :no_content }
    end
  end
end
