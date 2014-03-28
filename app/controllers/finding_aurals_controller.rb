class FindingAuralsController < ApplicationController
  # GET /finding_aurals
  # GET /finding_aurals.json
  def index
    @finding_aurals = FindingAural.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finding_aurals }
    end
  end

  # GET /finding_aurals/1
  # GET /finding_aurals/1.json
  def show
    @finding_aural = FindingAural.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finding_aural }
    end
  end

  # GET /finding_aurals/new
  # GET /finding_aurals/new.json
  def new
    @finding_aural = FindingAural.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finding_aural }
    end
  end

  # GET /finding_aurals/1/edit
  def edit
    @finding_aural = FindingAural.find(params[:id])
  end

  # POST /finding_aurals
  # POST /finding_aurals.json
  def create
    @finding_aural = FindingAural.new(params[:finding_aural])

    respond_to do |format|
      if @finding_aural.save
        format.html { redirect_to @finding_aural, notice: 'Finding aural was successfully created.' }
        format.json { render json: @finding_aural, status: :created, location: @finding_aural }
      else
        format.html { render action: "new" }
        format.json { render json: @finding_aural.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finding_aurals/1
  # PUT /finding_aurals/1.json
  def update
    @finding_aural = FindingAural.find(params[:id])

    respond_to do |format|
      if @finding_aural.update_attributes(params[:finding_aural])
        format.html { redirect_to @finding_aural, notice: 'Finding aural was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finding_aural.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finding_aurals/1
  # DELETE /finding_aurals/1.json
  def destroy
    @finding_aural = FindingAural.find(params[:id])
    @finding_aural.destroy

    respond_to do |format|
      format.html { redirect_to finding_aurals_url }
      format.json { head :no_content }
    end
  end
end
