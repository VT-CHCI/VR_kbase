class VisualFidelitiesController < ApplicationController
  # GET /visual_fidelities
  # GET /visual_fidelities.json
  def index
    @visual_fidelities = VisualFidelity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @visual_fidelities }
    end
  end

  # GET /visual_fidelities/1
  # GET /visual_fidelities/1.json
  def show
    @visual_fidelity = VisualFidelity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @visual_fidelity }
    end
  end

  # GET /visual_fidelities/new
  # GET /visual_fidelities/new.json
  def new
    @visual_fidelity = VisualFidelity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @visual_fidelity }
    end
  end

  # GET /visual_fidelities/1/edit
  def edit
    @visual_fidelity = VisualFidelity.find(params[:id])
  end

  # POST /visual_fidelities
  # POST /visual_fidelities.json
  def create
    @visual_fidelity = VisualFidelity.new(params[:visual_fidelity])

    respond_to do |format|
      if @visual_fidelity.save
        format.html { redirect_to @visual_fidelity, notice: 'Visual fidelity was successfully created.' }
        format.json { render json: @visual_fidelity, status: :created, location: @visual_fidelity }
      else
        format.html { render action: "new" }
        format.json { render json: @visual_fidelity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /visual_fidelities/1
  # PUT /visual_fidelities/1.json
  def update
    @visual_fidelity = VisualFidelity.find(params[:id])

    respond_to do |format|
      if @visual_fidelity.update_attributes(params[:visual_fidelity])
        format.html { redirect_to @visual_fidelity, notice: 'Visual fidelity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @visual_fidelity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visual_fidelities/1
  # DELETE /visual_fidelities/1.json
  def destroy
    @visual_fidelity = VisualFidelity.find(params[:id])
    @visual_fidelity.destroy

    respond_to do |format|
      format.html { redirect_to visual_fidelities_url }
      format.json { head :no_content }
    end
  end
end
