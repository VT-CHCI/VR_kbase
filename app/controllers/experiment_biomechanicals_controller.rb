class ExperimentBiomechanicalsController < ApplicationController
  # GET /experiment_biomechanicals
  # GET /experiment_biomechanicals.json
  def index
    @experiment_biomechanicals = ExperimentBiomechanical.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @experiment_biomechanicals }
    end
  end

  # GET /experiment_biomechanicals/1
  # GET /experiment_biomechanicals/1.json
  def show
    @experiment_biomechanical = ExperimentBiomechanical.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @experiment_biomechanical }
    end
  end

  # GET /experiment_biomechanicals/new
  # GET /experiment_biomechanicals/new.json
  def new
    @experiment_biomechanical = ExperimentBiomechanical.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @experiment_biomechanical }
    end
  end

  # GET /experiment_biomechanicals/1/edit
  def edit
    @experiment_biomechanical = ExperimentBiomechanical.find(params[:id])
  end

  # POST /experiment_biomechanicals
  # POST /experiment_biomechanicals.json
  def create
    @experiment_biomechanical = ExperimentBiomechanical.new(params[:experiment_biomechanical])

    respond_to do |format|
      if @experiment_biomechanical.save
        format.html { redirect_to @experiment_biomechanical, notice: 'Experiment biomechanical was successfully created.' }
        format.json { render json: @experiment_biomechanical, status: :created, location: @experiment_biomechanical }
      else
        format.html { render action: "new" }
        format.json { render json: @experiment_biomechanical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /experiment_biomechanicals/1
  # PUT /experiment_biomechanicals/1.json
  def update
    @experiment_biomechanical = ExperimentBiomechanical.find(params[:id])

    respond_to do |format|
      if @experiment_biomechanical.update_attributes(params[:experiment_biomechanical])
        format.html { redirect_to @experiment_biomechanical, notice: 'Experiment biomechanical was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @experiment_biomechanical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiment_biomechanicals/1
  # DELETE /experiment_biomechanicals/1.json
  def destroy
    @experiment_biomechanical = ExperimentBiomechanical.find(params[:id])
    @experiment_biomechanical.destroy

    respond_to do |format|
      format.html { redirect_to experiment_biomechanicals_url }
      format.json { head :no_content }
    end
  end
end
