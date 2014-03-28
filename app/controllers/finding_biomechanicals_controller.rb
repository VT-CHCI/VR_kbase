class FindingBiomechanicalsController < ApplicationController
  # GET /finding_biomechanicals
  # GET /finding_biomechanicals.json
  def index
    @finding_biomechanicals = FindingBiomechanical.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finding_biomechanicals }
    end
  end

  # GET /finding_biomechanicals/1
  # GET /finding_biomechanicals/1.json
  def show
    @finding_biomechanical = FindingBiomechanical.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finding_biomechanical }
    end
  end

  # GET /finding_biomechanicals/new
  # GET /finding_biomechanicals/new.json
  def new
    @finding_biomechanical = FindingBiomechanical.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finding_biomechanical }
    end
  end

  # GET /finding_biomechanicals/1/edit
  def edit
    @finding_biomechanical = FindingBiomechanical.find(params[:id])
  end

  # POST /finding_biomechanicals
  # POST /finding_biomechanicals.json
  def create
    @finding_biomechanical = FindingBiomechanical.new(params[:finding_biomechanical])

    respond_to do |format|
      if @finding_biomechanical.save
        format.html { redirect_to @finding_biomechanical, notice: 'Finding biomechanical was successfully created.' }
        format.json { render json: @finding_biomechanical, status: :created, location: @finding_biomechanical }
      else
        format.html { render action: "new" }
        format.json { render json: @finding_biomechanical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finding_biomechanicals/1
  # PUT /finding_biomechanicals/1.json
  def update
    @finding_biomechanical = FindingBiomechanical.find(params[:id])

    respond_to do |format|
      if @finding_biomechanical.update_attributes(params[:finding_biomechanical])
        format.html { redirect_to @finding_biomechanical, notice: 'Finding biomechanical was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finding_biomechanical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finding_biomechanicals/1
  # DELETE /finding_biomechanicals/1.json
  def destroy
    @finding_biomechanical = FindingBiomechanical.find(params[:id])
    @finding_biomechanical.destroy

    respond_to do |format|
      format.html { redirect_to finding_biomechanicals_url }
      format.json { head :no_content }
    end
  end
end
