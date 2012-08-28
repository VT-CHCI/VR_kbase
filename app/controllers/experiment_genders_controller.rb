class ExperimentGendersController < ApplicationController
  # GET /experiment_genders
  # GET /experiment_genders.json
  def index
    @experiment_genders = ExperimentGender.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @experiment_genders }
    end
  end

  # GET /experiment_genders/1
  # GET /experiment_genders/1.json
  def show
    @experiment_gender = ExperimentGender.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @experiment_gender }
    end
  end

  # GET /experiment_genders/new
  # GET /experiment_genders/new.json
  def new
    @experiment_gender = ExperimentGender.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @experiment_gender }
    end
  end

  # GET /experiment_genders/1/edit
  def edit
    @experiment_gender = ExperimentGender.find(params[:id])
  end

  # POST /experiment_genders
  # POST /experiment_genders.json
  def create
    @experiment_gender = ExperimentGender.new(params[:experiment_gender])

    respond_to do |format|
      if @experiment_gender.save
        format.html { redirect_to @experiment_gender, :notice => 'Experiment gender was successfully created.' }
        format.json { render :json => @experiment_gender, :status => :created, :location => @experiment_gender }
      else
        format.html { render :action => "new" }
        format.json { render :json => @experiment_gender.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /experiment_genders/1
  # PUT /experiment_genders/1.json
  def update
    @experiment_gender = ExperimentGender.find(params[:id])

    respond_to do |format|
      if @experiment_gender.update_attributes(params[:experiment_gender])
        format.html { redirect_to @experiment_gender, :notice => 'Experiment gender was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @experiment_gender.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /experiment_genders/1
  # DELETE /experiment_genders/1.json
  def destroy
    @experiment_gender = ExperimentGender.find(params[:id])
    @experiment_gender.destroy

    respond_to do |format|
      format.html { redirect_to experiment_genders_url }
      format.json { head :no_content }
    end
  end
end
