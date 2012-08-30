class FindingRelationshipsController < ApplicationController
  # GET /finding_relationships
  # GET /finding_relationships.json
  def index
    @finding_relationships = FindingRelationship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @finding_relationships }
    end
  end

  # GET /finding_relationships/1
  # GET /finding_relationships/1.json
  def show
    @finding_relationship = FindingRelationship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @finding_relationship }
    end
  end

  # GET /finding_relationships/new
  # GET /finding_relationships/new.json
  def new
    @finding_relationship = FindingRelationship.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @finding_relationship }
    end
  end

  # GET /finding_relationships/1/edit
  def edit
    @finding_relationship = FindingRelationship.find(params[:id])
  end

  # POST /finding_relationships
  # POST /finding_relationships.json
  def create
    @finding_relationship = FindingRelationship.new(params[:finding_relationship])

    respond_to do |format|
      if @finding_relationship.save
        format.html { redirect_to @finding_relationship, :notice => 'Finding relationship was successfully created.' }
        format.json { render :json => @finding_relationship, :status => :created, :location => @finding_relationship }
      else
        format.html { render :action => "new" }
        format.json { render :json => @finding_relationship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /finding_relationships/1
  # PUT /finding_relationships/1.json
  def update
    @finding_relationship = FindingRelationship.find(params[:id])

    respond_to do |format|
      if @finding_relationship.update_attributes(params[:finding_relationship])
        format.html { redirect_to @finding_relationship, :notice => 'Finding relationship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @finding_relationship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /finding_relationships/1
  # DELETE /finding_relationships/1.json
  def destroy
    @finding_relationship = FindingRelationship.find(params[:id])
    @finding_relationship.destroy

    respond_to do |format|
      format.html { redirect_to finding_relationships_url }
      format.json { head :no_content }
    end
  end
end
