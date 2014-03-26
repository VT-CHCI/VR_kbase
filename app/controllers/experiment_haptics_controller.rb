class ExperimentHapticsController < ApplicationController
  # GET /experiment_haptics
  # GET /experiment_haptics.json
  def index
    @experiment_haptics = ExperimentHaptic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @experiment_haptics }
    end
  end

  # GET /experiment_haptics/1
  # GET /experiment_haptics/1.json
  def show
    @experiment_haptic = ExperimentHaptic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @experiment_haptic }
    end
  end

  # GET /experiment_haptics/new
  # GET /experiment_haptics/new.json
  def new
    @experiment_haptic = ExperimentHaptic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @experiment_haptic }
    end
  end

  # GET /experiment_haptics/1/edit
  def edit
    @experiment_haptic = ExperimentHaptic.find(params[:id])
  end

  # POST /experiment_haptics
  # POST /experiment_haptics.json
  def create
    @experiment_haptic = ExperimentHaptic.new(params[:experiment_haptic])

    respond_to do |format|
      if @experiment_haptic.save
        format.html { redirect_to @experiment_haptic, notice: 'Experiment haptic was successfully created.' }
        format.json { render json: @experiment_haptic, status: :created, location: @experiment_haptic }
      else
        format.html { render action: "new" }
        format.json { render json: @experiment_haptic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /experiment_haptics/1
  # PUT /experiment_haptics/1.json
  def update
    @experiment_haptic = ExperimentHaptic.find(params[:id])

    respond_to do |format|
      if @experiment_haptic.update_attributes(params[:experiment_haptic])
        format.html { redirect_to @experiment_haptic, notice: 'Experiment haptic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @experiment_haptic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiment_haptics/1
  # DELETE /experiment_haptics/1.json
  def destroy
    @experiment_haptic = ExperimentHaptic.find(params[:id])
    @experiment_haptic.destroy

    respond_to do |format|
      format.html { redirect_to experiment_haptics_url }
      format.json { head :no_content }
    end
  end
end
