class FindingControlsController < ApplicationController
  # GET /finding_controls
  # GET /finding_controls.json
  def index
    @finding_controls = FindingControl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finding_controls }
    end
  end

  # GET /finding_controls/1
  # GET /finding_controls/1.json
  def show
    @finding_control = FindingControl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finding_control }
    end
  end

  # GET /finding_controls/new
  # GET /finding_controls/new.json
  def new
    @finding_control = FindingControl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finding_control }
    end
  end

  # GET /finding_controls/1/edit
  def edit
    @finding_control = FindingControl.find(params[:id])
  end

  # POST /finding_controls
  # POST /finding_controls.json
  def create
    @finding_control = FindingControl.new(params[:finding_control])

    respond_to do |format|
      if @finding_control.save
        format.html { redirect_to @finding_control, notice: 'Finding control was successfully created.' }
        format.json { render json: @finding_control, status: :created, location: @finding_control }
      else
        format.html { render action: "new" }
        format.json { render json: @finding_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finding_controls/1
  # PUT /finding_controls/1.json
  def update
    @finding_control = FindingControl.find(params[:id])

    respond_to do |format|
      if @finding_control.update_attributes(params[:finding_control])
        format.html { redirect_to @finding_control, notice: 'Finding control was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finding_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finding_controls/1
  # DELETE /finding_controls/1.json
  def destroy
    @finding_control = FindingControl.find(params[:id])
    @finding_control.destroy

    respond_to do |format|
      format.html { redirect_to finding_controls_url }
      format.json { head :no_content }
    end
  end
end
