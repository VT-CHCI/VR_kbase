class SpecificitiesController < ApplicationController
  # GET /specificities
  # GET /specificities.json
  def index
    @specificities = Specificity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @specificities }
    end
  end

  # GET /specificities/1
  # GET /specificities/1.json
  def show
    @specificity = Specificity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @specificity }
    end
  end

  # GET /specificities/new
  # GET /specificities/new.json
  def new
    @specificity = Specificity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @specificity }
    end
  end

  # GET /specificities/1/edit
  def edit
    @specificity = Specificity.find(params[:id])
  end

  # POST /specificities
  # POST /specificities.json
  def create
    @specificity = Specificity.new(params[:specificity])

    respond_to do |format|
      if @specificity.save
        format.html { redirect_to @specificity, :notice => 'Specificity was successfully created.' }
        format.json { render :json => @specificity, :status => :created, :location => @specificity }
      else
        format.html { render :action => "new" }
        format.json { render :json => @specificity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /specificities/1
  # PUT /specificities/1.json
  def update
    @specificity = Specificity.find(params[:id])

    respond_to do |format|
      if @specificity.update_attributes(params[:specificity])
        format.html { redirect_to @specificity, :notice => 'Specificity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @specificity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /specificities/1
  # DELETE /specificities/1.json
  def destroy
    @specificity = Specificity.find(params[:id])
    @specificity.destroy

    respond_to do |format|
      format.html { redirect_to specificities_url }
      format.json { head :no_content }
    end
  end
end
