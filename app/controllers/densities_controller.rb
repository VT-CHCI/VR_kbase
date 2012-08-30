class DensitiesController < ApplicationController
  # GET /densities
  # GET /densities.json
  def index
    @densities = Density.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @densities }
    end
  end

  # GET /densities/1
  # GET /densities/1.json
  def show
    @density = Density.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @density }
    end
  end

  # GET /densities/new
  # GET /densities/new.json
  def new
    @density = Density.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @density }
    end
  end

  # GET /densities/1/edit
  def edit
    @density = Density.find(params[:id])
  end

  # POST /densities
  # POST /densities.json
  def create
    @density = Density.new(params[:density])

    respond_to do |format|
      if @density.save
        format.html { redirect_to @density, :notice => 'Density was successfully created.' }
        format.json { render :json => @density, :status => :created, :location => @density }
      else
        format.html { render :action => "new" }
        format.json { render :json => @density.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /densities/1
  # PUT /densities/1.json
  def update
    @density = Density.find(params[:id])

    respond_to do |format|
      if @density.update_attributes(params[:density])
        format.html { redirect_to @density, :notice => 'Density was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @density.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /densities/1
  # DELETE /densities/1.json
  def destroy
    @density = Density.find(params[:id])
    @density.destroy

    respond_to do |format|
      format.html { redirect_to densities_url }
      format.json { head :no_content }
    end
  end
end
