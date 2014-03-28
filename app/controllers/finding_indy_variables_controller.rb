class FindingIndyVariablesController < ApplicationController
  # GET /finding_indy_variables
  # GET /finding_indy_variables.json
  def index
    @finding_indy_variables = FindingIndyVariable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finding_indy_variables }
    end
  end

  # GET /finding_indy_variables/1
  # GET /finding_indy_variables/1.json
  def show
    @finding_indy_variable = FindingIndyVariable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finding_indy_variable }
    end
  end

  # GET /finding_indy_variables/new
  # GET /finding_indy_variables/new.json
  def new
    @finding_indy_variable = FindingIndyVariable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finding_indy_variable }
    end
  end

  # GET /finding_indy_variables/1/edit
  def edit
    @finding_indy_variable = FindingIndyVariable.find(params[:id])
  end

  # POST /finding_indy_variables
  # POST /finding_indy_variables.json
  def create
    @finding_indy_variable = FindingIndyVariable.new(params[:finding_indy_variable])

    respond_to do |format|
      if @finding_indy_variable.save
        format.html { redirect_to @finding_indy_variable, notice: 'Finding indy variable was successfully created.' }
        format.json { render json: @finding_indy_variable, status: :created, location: @finding_indy_variable }
      else
        format.html { render action: "new" }
        format.json { render json: @finding_indy_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finding_indy_variables/1
  # PUT /finding_indy_variables/1.json
  def update
    @finding_indy_variable = FindingIndyVariable.find(params[:id])

    respond_to do |format|
      if @finding_indy_variable.update_attributes(params[:finding_indy_variable])
        format.html { redirect_to @finding_indy_variable, notice: 'Finding indy variable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finding_indy_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finding_indy_variables/1
  # DELETE /finding_indy_variables/1.json
  def destroy
    @finding_indy_variable = FindingIndyVariable.find(params[:id])
    @finding_indy_variable.destroy

    respond_to do |format|
      format.html { redirect_to finding_indy_variables_url }
      format.json { head :no_content }
    end
  end
end
