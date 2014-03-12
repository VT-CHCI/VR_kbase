class ExperimentIndyVariablesController < ApplicationController
  # GET /experiment_indy_variables
  # GET /experiment_indy_variables.json
  def index
    @experiment_indy_variables = ExperimentIndyVariable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @experiment_indy_variables }
    end
  end

  # GET /experiment_indy_variables/1
  # GET /experiment_indy_variables/1.json
  def show
    @experiment_indy_variable = ExperimentIndyVariable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @experiment_indy_variable }
    end
  end

  # GET /experiment_indy_variables/new
  # GET /experiment_indy_variables/new.json
  def new
    @experiment_indy_variable = ExperimentIndyVariable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @experiment_indy_variable }
    end
  end

  # GET /experiment_indy_variables/1/edit
  def edit
    @experiment_indy_variable = ExperimentIndyVariable.find(params[:id])
  end

  # POST /experiment_indy_variables
  # POST /experiment_indy_variables.json
  def create
    @experiment_indy_variable = ExperimentIndyVariable.new(params[:experiment_indy_variable])

    respond_to do |format|
      if @experiment_indy_variable.save
        format.html { redirect_to @experiment_indy_variable, notice: 'Experiment indy variable was successfully created.' }
        format.json { render json: @experiment_indy_variable, status: :created, location: @experiment_indy_variable }
      else
        format.html { render action: "new" }
        format.json { render json: @experiment_indy_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /experiment_indy_variables/1
  # PUT /experiment_indy_variables/1.json
  def update
    @experiment_indy_variable = ExperimentIndyVariable.find(params[:id])

    respond_to do |format|
      if @experiment_indy_variable.update_attributes(params[:experiment_indy_variable])
        format.html { redirect_to @experiment_indy_variable, notice: 'Experiment indy variable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @experiment_indy_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiment_indy_variables/1
  # DELETE /experiment_indy_variables/1.json
  def destroy
    @experiment_indy_variable = ExperimentIndyVariable.find(params[:id])
    @experiment_indy_variable.destroy

    respond_to do |format|
      format.html { redirect_to experiment_indy_variables_url }
      format.json { head :no_content }
    end
  end
end
