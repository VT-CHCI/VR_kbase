class RealismsController < ApplicationController
  # GET /realisms
  # GET /realisms.json
  def index
    @realisms = Realism.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @realisms }
    end
  end

  # GET /realisms/1
  # GET /realisms/1.json
  def show
    @realism = Realism.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @realism }
    end
  end

  # GET /realisms/new
  # GET /realisms/new.json
  def new
    @realism = Realism.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @realism }
    end
  end

  # GET /realisms/1/edit
  def edit
    @realism = Realism.find(params[:id])
  end

  # POST /realisms
  # POST /realisms.json
  def create
    @realism = Realism.new(params[:realism])

    respond_to do |format|
      if @realism.save
        format.html { redirect_to @realism, :notice => 'Realism was successfully created.' }
        format.json { render :json => @realism, :status => :created, :location => @realism }
      else
        format.html { render :action => "new" }
        format.json { render :json => @realism.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /realisms/1
  # PUT /realisms/1.json
  def update
    @realism = Realism.find(params[:id])

    respond_to do |format|
      if @realism.update_attributes(params[:realism])
        format.html { redirect_to @realism, :notice => 'Realism was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @realism.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /realisms/1
  # DELETE /realisms/1.json
  def destroy
    @realism = Realism.find(params[:id])
    @realism.destroy

    respond_to do |format|
      format.html { redirect_to realisms_url }
      format.json { head :no_content }
    end
  end
end
