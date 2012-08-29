class DisplaysController < ApplicationController
  # GET /displays
  # GET /displays.json
  def index
    @displays = Display.where("display like ?", "%#{params[:q]}%")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @displays }
    end
  end

  # GET /displays/1
  # GET /displays/1.json
  def show
    @display = Display.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @display }
    end
  end

  # GET /displays/new
  # GET /displays/new.json
  def new
    @display = Display.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @display }
    end
  end

  # GET /displays/1/edit
  def edit
    @display = Display.find(params[:id])
  end

  # POST /displays
  # POST /displays.json
  def create
    @display = Display.new(params[:display])

    respond_to do |format|
      if @display.save
        format.html { redirect_to @display, :notice => 'Display was successfully created.' }
        format.json { render :json => @display, :status => :created, :location => @display }
      else
        format.html { render :action => "new" }
        format.json { render :json => @display.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /displays/1
  # PUT /displays/1.json
  def update
    @display = Display.find(params[:id])

    respond_to do |format|
      if @display.update_attributes(params[:display])
        format.html { redirect_to @display, :notice => 'Display was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @display.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /displays/1
  # DELETE /displays/1.json
  def destroy
    @display = Display.find(params[:id])
    @display.destroy

    respond_to do |format|
      format.html { redirect_to displays_url }
      format.json { head :no_content }
    end
  end
end
