class SystemAppropriatenessesController < ApplicationController
  # GET /system_appropriatenesses
  # GET /system_appropriatenesses.json
  def index
    @system_appropriatenesses = SystemAppropriateness.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @system_appropriatenesses }
    end
  end

  # GET /system_appropriatenesses/1
  # GET /system_appropriatenesses/1.json
  def show
    @system_appropriateness = SystemAppropriateness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @system_appropriateness }
    end
  end

  # GET /system_appropriatenesses/new
  # GET /system_appropriatenesses/new.json
  def new
    @system_appropriateness = SystemAppropriateness.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @system_appropriateness }
    end
  end

  # GET /system_appropriatenesses/1/edit
  def edit
    @system_appropriateness = SystemAppropriateness.find(params[:id])
  end

  # POST /system_appropriatenesses
  # POST /system_appropriatenesses.json
  def create
    @system_appropriateness = SystemAppropriateness.new(params[:system_appropriateness])

    respond_to do |format|
      if @system_appropriateness.save
        format.html { redirect_to @system_appropriateness, notice: 'System appropriateness was successfully created.' }
        format.json { render json: @system_appropriateness, status: :created, location: @system_appropriateness }
      else
        format.html { render action: "new" }
        format.json { render json: @system_appropriateness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /system_appropriatenesses/1
  # PUT /system_appropriatenesses/1.json
  def update
    @system_appropriateness = SystemAppropriateness.find(params[:id])

    respond_to do |format|
      if @system_appropriateness.update_attributes(params[:system_appropriateness])
        format.html { redirect_to @system_appropriateness, notice: 'System appropriateness was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @system_appropriateness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system_appropriatenesses/1
  # DELETE /system_appropriatenesses/1.json
  def destroy
    @system_appropriateness = SystemAppropriateness.find(params[:id])
    @system_appropriateness.destroy

    respond_to do |format|
      format.html { redirect_to system_appropriatenesses_url }
      format.json { head :no_content }
    end
  end
end
