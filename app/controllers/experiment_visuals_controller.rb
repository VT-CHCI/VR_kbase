class ExperimentVisualsController < ApplicationController
  # GET /experiment_visuals
  # GET /experiment_visuals.json
  def index
    @experiment_visuals = ExperimentVisual.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @experiment_visuals }
    end
  end

  # GET /experiment_visuals/1
  # GET /experiment_visuals/1.json
  def show
    @experiment_visual = ExperimentVisual.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @experiment_visual }
    end
  end

  # GET /experiment_visuals/new
  # GET /experiment_visuals/new.json
  def new
    @experiment_visual = ExperimentVisual.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @experiment_visual }
    end
  end

  # GET /experiment_visuals/1/edit
  def edit
    @experiment_visual = ExperimentVisual.find(params[:id])
  end

  # POST /experiment_visuals
  # POST /experiment_visuals.json
  def create
    @experiment_visual = ExperimentVisual.new(params[:experiment_visual])

    respond_to do |format|
      if @experiment_visual.save
        format.html { redirect_to @experiment_visual, notice: 'Experiment visual was successfully created.' }
        format.json { render json: @experiment_visual, status: :created, location: @experiment_visual }
      else
        format.html { render action: "new" }
        format.json { render json: @experiment_visual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /experiment_visuals/1
  # PUT /experiment_visuals/1.json
  def update
    @experiment_visual = ExperimentVisual.find(params[:id])

    respond_to do |format|
      if @experiment_visual.update_attributes(params[:experiment_visual])
        format.html { redirect_to @experiment_visual, notice: 'Experiment visual was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @experiment_visual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiment_visuals/1
  # DELETE /experiment_visuals/1.json
  def destroy
    @experiment_visual = ExperimentVisual.find(params[:id])
    @experiment_visual.destroy

    respond_to do |format|
      format.html { redirect_to experiment_visuals_url }
      format.json { head :no_content }
    end
  end
end
