class BiomechanicalSymmetriesController < ApplicationController
  # GET /biomechanical_symmetries
  # GET /biomechanical_symmetries.json
  def index
    @biomechanical_symmetries = BiomechanicalSymmetry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @biomechanical_symmetries }
    end
  end

  # GET /biomechanical_symmetries/1
  # GET /biomechanical_symmetries/1.json
  def show
    @biomechanical_symmetry = BiomechanicalSymmetry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @biomechanical_symmetry }
    end
  end

  # GET /biomechanical_symmetries/new
  # GET /biomechanical_symmetries/new.json
  def new
    @biomechanical_symmetry = BiomechanicalSymmetry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @biomechanical_symmetry }
    end
  end

  # GET /biomechanical_symmetries/1/edit
  def edit
    @biomechanical_symmetry = BiomechanicalSymmetry.find(params[:id])
  end

  # POST /biomechanical_symmetries
  # POST /biomechanical_symmetries.json
  def create
    @biomechanical_symmetry = BiomechanicalSymmetry.new(params[:biomechanical_symmetry])

    respond_to do |format|
      if @biomechanical_symmetry.save
        format.html { redirect_to @biomechanical_symmetry, notice: 'Biomechanical symmetry was successfully created.' }
        format.json { render json: @biomechanical_symmetry, status: :created, location: @biomechanical_symmetry }
      else
        format.html { render action: "new" }
        format.json { render json: @biomechanical_symmetry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /biomechanical_symmetries/1
  # PUT /biomechanical_symmetries/1.json
  def update
    @biomechanical_symmetry = BiomechanicalSymmetry.find(params[:id])

    respond_to do |format|
      if @biomechanical_symmetry.update_attributes(params[:biomechanical_symmetry])
        format.html { redirect_to @biomechanical_symmetry, notice: 'Biomechanical symmetry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @biomechanical_symmetry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /biomechanical_symmetries/1
  # DELETE /biomechanical_symmetries/1.json
  def destroy
    @biomechanical_symmetry = BiomechanicalSymmetry.find(params[:id])
    @biomechanical_symmetry.destroy

    respond_to do |format|
      format.html { redirect_to biomechanical_symmetries_url }
      format.json { head :no_content }
    end
  end
end
