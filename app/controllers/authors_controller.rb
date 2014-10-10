class AuthorsController < ApplicationController
  # GET /authors
  # GET /authors.json
  def index
    @authors = Author.all

    respond_to do |format|
      if user_signed_in? and current_user.admin
        format.html # index.html.erb
        format.json { render :json => @authors }
      else
        format.html { redirect_to landing_url }
        format.json { head :no_content }
      end
    end
  end

  # GET /authors/1
  # GET /authors/1.json
  def show
    @author = Author.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @author }
    end
  end

  # GET /authors/lastName/firstName/middleInitial.json
  def search_name
    if (params[:middle_initial])
      @author = Author.where(:last_name => params[:last_name], :first_name => params[:first_name], :middle_initial => params[:middle_initial]).first
    else
      @author = Author.where(:last_name => params[:last_name], :first_name => params[:first_name]).first
    end

    respond_to do |format|
      if user_signed_in? and current_user.admin
        format.html # search_name.html.erb
        format.json { render :json => @author }
      else
        format.html { redirect_to landing_url }
        format.json { head :no_content }
      end
    end
  end

  # GET /authors/new
  # GET /authors/new.json
  def new
    @author = Author.new

    respond_to do |format|
      if user_signed_in? and current_user.admin
        format.html # new.html.erb
        format.json { render :json => @author }
      else
        format.html { redirect_to landing_url }
        format.json { head :no_content }
      end
    end
  end

  # GET /authors/1/edit
  def edit
    @author = Author.find(params[:id])

    respond_to do |format|
      if user_signed_in? and current_user.admin
        format.html # new.html.erb
        format.json { render :json => @author }
      else
        format.html { redirect_to landing_url }
        format.json { head :no_content }
      end
    end
  end

  # POST /authors
  # POST /authors.json
  def create
    @author = Author.new(params[:author])

    respond_to do |format|
      if user_signed_in? and current_user.admin
        if @author.save
          format.html { redirect_to @author, :notice => 'Author was successfully created.' }
          format.json { render :json => @author, :status => :created, :location => @author }
        else
          format.html { render :action => "new" }
          format.json { render :json => @author.errors, :status => :unprocessable_entity }
        end
      else
        format.html { redirect_to landing_url }
        format.json { head :no_content }
      end
    end
  end

  # PUT /authors/1
  # PUT /authors/1.json
  def update
    @author = Author.find(params[:id])

    respond_to do |format|
      if user_signed_in? and current_user.admin
        if @author.update_attributes(params[:author])
          format.html { redirect_to @author, :notice => 'Author was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @author.errors, :status => :unprocessable_entity }
        end
      else
        format.html { redirect_to landing_url }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    respond_to do |format|
      if user_signed_in? and current_user.admin
        format.html { redirect_to authors_url }
        format.json { head :no_content }
      else
        format.html { redirect_to landing_url }
        format.json { head :no_content }
      end
    end
  end
end
