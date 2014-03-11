class ControlSymmetriesController < ApplicationController
  # GET /control_symmetries
  # GET /control_symmetries.json
  def index
    @control_symmetries = ControlSymmetry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @control_symmetries }
    end
  end

  # GET /control_symmetries/1
  # GET /control_symmetries/1.json
  def show
    @control_symmetry = ControlSymmetry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @control_symmetry }
    end
  end

  # GET /control_symmetries/new
  # GET /control_symmetries/new.json
  def new
    @control_symmetry = ControlSymmetry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @control_symmetry }
    end
  end

  # GET /control_symmetries/1/edit
  def edit
    @control_symmetry = ControlSymmetry.find(params[:id])
  end

  # POST /control_symmetries
  # POST /control_symmetries.json
  def create
    @control_symmetry = ControlSymmetry.new(params[:control_symmetry])

    respond_to do |format|
      if @control_symmetry.save
        format.html { redirect_to @control_symmetry, notice: 'Control symmetry was successfully created.' }
        format.json { render json: @control_symmetry, status: :created, location: @control_symmetry }
      else
        format.html { render action: "new" }
        format.json { render json: @control_symmetry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /control_symmetries/1
  # PUT /control_symmetries/1.json
  def update
    @control_symmetry = ControlSymmetry.find(params[:id])

    respond_to do |format|
      if @control_symmetry.update_attributes(params[:control_symmetry])
        format.html { redirect_to @control_symmetry, notice: 'Control symmetry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @control_symmetry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /control_symmetries/1
  # DELETE /control_symmetries/1.json
  def destroy
    @control_symmetry = ControlSymmetry.find(params[:id])
    @control_symmetry.destroy

    respond_to do |format|
      format.html { redirect_to control_symmetries_url }
      format.json { head :no_content }
    end
  end
end
