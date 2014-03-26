class HapticFidelitiesController < ApplicationController
  # GET /haptic_fidelities
  # GET /haptic_fidelities.json
  def index
    @haptic_fidelities = HapticFidelity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @haptic_fidelities }
    end
  end

  # GET /haptic_fidelities/1
  # GET /haptic_fidelities/1.json
  def show
    @haptic_fidelity = HapticFidelity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @haptic_fidelity }
    end
  end

  # GET /haptic_fidelities/new
  # GET /haptic_fidelities/new.json
  def new
    @haptic_fidelity = HapticFidelity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @haptic_fidelity }
    end
  end

  # GET /haptic_fidelities/1/edit
  def edit
    @haptic_fidelity = HapticFidelity.find(params[:id])
  end

  # POST /haptic_fidelities
  # POST /haptic_fidelities.json
  def create
    @haptic_fidelity = HapticFidelity.new(params[:haptic_fidelity])

    respond_to do |format|
      if @haptic_fidelity.save
        format.html { redirect_to @haptic_fidelity, notice: 'Haptic fidelity was successfully created.' }
        format.json { render json: @haptic_fidelity, status: :created, location: @haptic_fidelity }
      else
        format.html { render action: "new" }
        format.json { render json: @haptic_fidelity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /haptic_fidelities/1
  # PUT /haptic_fidelities/1.json
  def update
    @haptic_fidelity = HapticFidelity.find(params[:id])

    respond_to do |format|
      if @haptic_fidelity.update_attributes(params[:haptic_fidelity])
        format.html { redirect_to @haptic_fidelity, notice: 'Haptic fidelity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @haptic_fidelity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /haptic_fidelities/1
  # DELETE /haptic_fidelities/1.json
  def destroy
    @haptic_fidelity = HapticFidelity.find(params[:id])
    @haptic_fidelity.destroy

    respond_to do |format|
      format.html { redirect_to haptic_fidelities_url }
      format.json { head :no_content }
    end
  end
end
