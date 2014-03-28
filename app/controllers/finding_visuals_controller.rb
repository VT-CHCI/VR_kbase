class FindingVisualsController < ApplicationController
  # GET /finding_visuals
  # GET /finding_visuals.json
  def index
    @finding_visuals = FindingVisual.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finding_visuals }
    end
  end

  # GET /finding_visuals/1
  # GET /finding_visuals/1.json
  def show
    @finding_visual = FindingVisual.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finding_visual }
    end
  end

  # GET /finding_visuals/new
  # GET /finding_visuals/new.json
  def new
    @finding_visual = FindingVisual.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finding_visual }
    end
  end

  # GET /finding_visuals/1/edit
  def edit
    @finding_visual = FindingVisual.find(params[:id])
  end

  # POST /finding_visuals
  # POST /finding_visuals.json
  def create
    @finding_visual = FindingVisual.new(params[:finding_visual])

    respond_to do |format|
      if @finding_visual.save
        format.html { redirect_to @finding_visual, notice: 'Finding visual was successfully created.' }
        format.json { render json: @finding_visual, status: :created, location: @finding_visual }
      else
        format.html { render action: "new" }
        format.json { render json: @finding_visual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finding_visuals/1
  # PUT /finding_visuals/1.json
  def update
    @finding_visual = FindingVisual.find(params[:id])

    respond_to do |format|
      if @finding_visual.update_attributes(params[:finding_visual])
        format.html { redirect_to @finding_visual, notice: 'Finding visual was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finding_visual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finding_visuals/1
  # DELETE /finding_visuals/1.json
  def destroy
    @finding_visual = FindingVisual.find(params[:id])
    @finding_visual.destroy

    respond_to do |format|
      format.html { redirect_to finding_visuals_url }
      format.json { head :no_content }
    end
  end
end
