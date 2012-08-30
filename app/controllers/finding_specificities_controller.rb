class FindingSpecificitiesController < ApplicationController
  # GET /finding_specificities
  # GET /finding_specificities.json
  def index
    @finding_specificities = FindingSpecificity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @finding_specificities }
    end
  end

  # GET /finding_specificities/1
  # GET /finding_specificities/1.json
  def show
    @finding_specificity = FindingSpecificity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @finding_specificity }
    end
  end

  # GET /finding_specificities/new
  # GET /finding_specificities/new.json
  def new
    @finding_specificity = FindingSpecificity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @finding_specificity }
    end
  end

  # GET /finding_specificities/1/edit
  def edit
    @finding_specificity = FindingSpecificity.find(params[:id])
  end

  # POST /finding_specificities
  # POST /finding_specificities.json
  def create
    @finding_specificity = FindingSpecificity.new(params[:finding_specificity])

    respond_to do |format|
      if @finding_specificity.save
        format.html { redirect_to @finding_specificity, :notice => 'Finding specificity was successfully created.' }
        format.json { render :json => @finding_specificity, :status => :created, :location => @finding_specificity }
      else
        format.html { render :action => "new" }
        format.json { render :json => @finding_specificity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /finding_specificities/1
  # PUT /finding_specificities/1.json
  def update
    @finding_specificity = FindingSpecificity.find(params[:id])

    respond_to do |format|
      if @finding_specificity.update_attributes(params[:finding_specificity])
        format.html { redirect_to @finding_specificity, :notice => 'Finding specificity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @finding_specificity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /finding_specificities/1
  # DELETE /finding_specificities/1.json
  def destroy
    @finding_specificity = FindingSpecificity.find(params[:id])
    @finding_specificity.destroy

    respond_to do |format|
      format.html { redirect_to finding_specificities_url }
      format.json { head :no_content }
    end
  end
end
