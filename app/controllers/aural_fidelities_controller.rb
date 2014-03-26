class AuralFidelitiesController < ApplicationController
  # GET /aural_fidelities
  # GET /aural_fidelities.json
  def index
    @aural_fidelities = AuralFidelity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aural_fidelities }
    end
  end

  # GET /aural_fidelities/1
  # GET /aural_fidelities/1.json
  def show
    @aural_fidelity = AuralFidelity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aural_fidelity }
    end
  end

  # GET /aural_fidelities/new
  # GET /aural_fidelities/new.json
  def new
    @aural_fidelity = AuralFidelity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aural_fidelity }
    end
  end

  # GET /aural_fidelities/1/edit
  def edit
    @aural_fidelity = AuralFidelity.find(params[:id])
  end

  # POST /aural_fidelities
  # POST /aural_fidelities.json
  def create
    @aural_fidelity = AuralFidelity.new(params[:aural_fidelity])

    respond_to do |format|
      if @aural_fidelity.save
        format.html { redirect_to @aural_fidelity, notice: 'Aural fidelity was successfully created.' }
        format.json { render json: @aural_fidelity, status: :created, location: @aural_fidelity }
      else
        format.html { render action: "new" }
        format.json { render json: @aural_fidelity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aural_fidelities/1
  # PUT /aural_fidelities/1.json
  def update
    @aural_fidelity = AuralFidelity.find(params[:id])

    respond_to do |format|
      if @aural_fidelity.update_attributes(params[:aural_fidelity])
        format.html { redirect_to @aural_fidelity, notice: 'Aural fidelity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aural_fidelity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aural_fidelities/1
  # DELETE /aural_fidelities/1.json
  def destroy
    @aural_fidelity = AuralFidelity.find(params[:id])
    @aural_fidelity.destroy

    respond_to do |format|
      format.html { redirect_to aural_fidelities_url }
      format.json { head :no_content }
    end
  end
end
