class PaperVenuesController < ApplicationController
  # GET /paper_venues
  # GET /paper_venues.json
  def index
    @paper_venues = PaperVenue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @paper_venues }
    end
  end

  # GET /paper_venues/1
  # GET /paper_venues/1.json
  def show
    @paper_venue = PaperVenue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @paper_venue }
    end
  end

  # GET /paper_venues/new
  # GET /paper_venues/new.json
  def new
    @paper_venue = PaperVenue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @paper_venue }
    end
  end

  # GET /paper_venue/1/edit
  def edit
    @paper_venue = PaperVenue.find(params[:id])
  end

  # POST /paper_venues
  # POST /paper_venues.json
  def create
    @paper_venue = PaperVenue.new(params[:paper_venue])

    respond_to do |format|
      if @paper_venue.save
        format.html { redirect_to @paper_venue, :notice => 'Paper venue was successfully created.' }
        format.json { render :json => @paper_venue, :status => :created, :location => @paper_venue }
      else
        format.html { render :action => "new" }
        format.json { render :json => @paper_venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /paper_venues/1
  # PUT /paper_venues/1.json
  def update
    @paper_venue = PaperVenue.find(params[:id])

    respond_to do |format|
      if @paper_venue.update_attributes(params[:paper_venue])
        format.html { redirect_to @paper_venue, :notice => 'Paper venue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @paper_venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /paper_venues/1
  # DELETE /paper_venues/1.json
  def destroy
    @paper_venue = PaperVenue.find(params[:id])
    @paper_venue.destroy

    respond_to do |format|
      format.html { redirect_to paper_venues_url }
      format.json { head :no_content }
    end
  end
end
