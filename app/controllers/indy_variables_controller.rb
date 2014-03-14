class IndyVariablesController < ApplicationController
  # GET /indy_variables
  # GET /indy_variables.json
  def index
    @indy_variables = IndyVariable.where("variable like ?", "%#{params[:q]}%")
    results = @indy_variables
    results << {:variable => "Add: #{params[:q]}", :id => "CREATE_#{params[:q]}_END"}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @indy_variables }
    end
  end

  # GET /indy_variables/1
  # GET /indy_variables/1.json
  def show
    @indy_variable = IndyVariable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @indy_variable }
    end
  end

  # GET /indy_variables/new
  # GET /indy_variables/new.json
  def new
    @indy_variable = IndyVariable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @indy_variable }
    end
  end

  # GET /indy_variables/1/edit
  def edit
    @indy_variable = IndyVariable.find(params[:id])
  end

  # POST /indy_variables
  # POST /indy_variables.json
  def create
    @indy_variable = IndyVariable.new(params[:indy_variable])

    respond_to do |format|
      if @indy_variable.save
        format.html { redirect_to @indy_variable, notice: 'Indy variable was successfully created.' }
        format.json { render json: @indy_variable, status: :created, location: @indy_variable }
      else
        format.html { render action: "new" }
        format.json { render json: @indy_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /indy_variables/1
  # PUT /indy_variables/1.json
  def update
    @indy_variable = IndyVariable.find(params[:id])

    respond_to do |format|
      if @indy_variable.update_attributes(params[:indy_variable])
        format.html { redirect_to @indy_variable, notice: 'Indy variable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @indy_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indy_variables/1
  # DELETE /indy_variables/1.json
  def destroy
    @indy_variable = IndyVariable.find(params[:id])
    @indy_variable.destroy

    respond_to do |format|
      format.html { redirect_to indy_variables_url }
      format.json { head :no_content }
    end
  end
end
