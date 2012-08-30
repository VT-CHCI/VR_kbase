class FindingComponentsController < ApplicationController
  # GET /finding_components
  # GET /finding_components.json
  def index
    @finding_components = FindingComponent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @finding_components }
    end
  end

  # GET /finding_components/1
  # GET /finding_components/1.json
  def show
    @finding_component = FindingComponent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @finding_component }
    end
  end

  # GET /finding_components/new
  # GET /finding_components/new.json
  def new
    @finding_component = FindingComponent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @finding_component }
    end
  end

  # GET /finding_components/1/edit
  def edit
    @finding_component = FindingComponent.find(params[:id])
  end

  # POST /finding_components
  # POST /finding_components.json
  def create
    @finding_component = FindingComponent.new(params[:finding_component])

    respond_to do |format|
      if @finding_component.save
        format.html { redirect_to @finding_component, :notice => 'Finding component was successfully created.' }
        format.json { render :json => @finding_component, :status => :created, :location => @finding_component }
      else
        format.html { render :action => "new" }
        format.json { render :json => @finding_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /finding_components/1
  # PUT /finding_components/1.json
  def update
    @finding_component = FindingComponent.find(params[:id])

    respond_to do |format|
      if @finding_component.update_attributes(params[:finding_component])
        format.html { redirect_to @finding_component, :notice => 'Finding component was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @finding_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /finding_components/1
  # DELETE /finding_components/1.json
  def destroy
    @finding_component = FindingComponent.find(params[:id])
    @finding_component.destroy

    respond_to do |format|
      format.html { redirect_to finding_components_url }
      format.json { head :no_content }
    end
  end
end
