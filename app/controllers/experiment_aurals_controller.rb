class ExperimentAuralsController < ApplicationController
  # GET /experiment_aurals
  # GET /experiment_aurals.json
  def index
    @experiment_aurals = ExperimentAural.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @experiment_aurals }
    end
  end

  # GET /experiment_aurals/1
  # GET /experiment_aurals/1.json
  def show
    @experiment_aural = ExperimentAural.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @experiment_aural }
    end
  end

  # GET /experiment_aurals/new
  # GET /experiment_aurals/new.json
  def new
    @experiment_aural = ExperimentAural.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @experiment_aural }
    end
  end

  # GET /experiment_aurals/1/edit
  def edit
    @experiment_aural = ExperimentAural.find(params[:id])
  end

  # POST /experiment_aurals
  # POST /experiment_aurals.json
  def create
    @experiment_aural = ExperimentAural.new(params[:experiment_aural])

    respond_to do |format|
      if @experiment_aural.save
        format.html { redirect_to @experiment_aural, notice: 'Experiment aural was successfully created.' }
        format.json { render json: @experiment_aural, status: :created, location: @experiment_aural }
      else
        format.html { render action: "new" }
        format.json { render json: @experiment_aural.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /experiment_aurals/1
  # PUT /experiment_aurals/1.json
  def update
    @experiment_aural = ExperimentAural.find(params[:id])

    respond_to do |format|
      if @experiment_aural.update_attributes(params[:experiment_aural])
        format.html { redirect_to @experiment_aural, notice: 'Experiment aural was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @experiment_aural.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiment_aurals/1
  # DELETE /experiment_aurals/1.json
  def destroy
    @experiment_aural = ExperimentAural.find(params[:id])
    @experiment_aural.destroy

    respond_to do |format|
      format.html { redirect_to experiment_aurals_url }
      format.json { head :no_content }
    end
  end
end
