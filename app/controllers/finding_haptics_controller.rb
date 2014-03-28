class FindingHapticsController < ApplicationController
  # GET /finding_haptics
  # GET /finding_haptics.json
  def index
    @finding_haptics = FindingHaptic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finding_haptics }
    end
  end

  # GET /finding_haptics/1
  # GET /finding_haptics/1.json
  def show
    @finding_haptic = FindingHaptic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finding_haptic }
    end
  end

  # GET /finding_haptics/new
  # GET /finding_haptics/new.json
  def new
    @finding_haptic = FindingHaptic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finding_haptic }
    end
  end

  # GET /finding_haptics/1/edit
  def edit
    @finding_haptic = FindingHaptic.find(params[:id])
  end

  # POST /finding_haptics
  # POST /finding_haptics.json
  def create
    @finding_haptic = FindingHaptic.new(params[:finding_haptic])

    respond_to do |format|
      if @finding_haptic.save
        format.html { redirect_to @finding_haptic, notice: 'Finding haptic was successfully created.' }
        format.json { render json: @finding_haptic, status: :created, location: @finding_haptic }
      else
        format.html { render action: "new" }
        format.json { render json: @finding_haptic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finding_haptics/1
  # PUT /finding_haptics/1.json
  def update
    @finding_haptic = FindingHaptic.find(params[:id])

    respond_to do |format|
      if @finding_haptic.update_attributes(params[:finding_haptic])
        format.html { redirect_to @finding_haptic, notice: 'Finding haptic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finding_haptic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finding_haptics/1
  # DELETE /finding_haptics/1.json
  def destroy
    @finding_haptic = FindingHaptic.find(params[:id])
    @finding_haptic.destroy

    respond_to do |format|
      format.html { redirect_to finding_haptics_url }
      format.json { head :no_content }
    end
  end
end
