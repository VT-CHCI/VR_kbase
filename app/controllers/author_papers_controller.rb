class AuthorPapersController < ApplicationController
  # GET /author_papers
  # GET /author_papers.json
  def index
    @author_papers = AuthorPaper.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @author_papers }
    end
  end

  # GET /author_papers/1
  # GET /author_papers/1.json
  def show
    @author_paper = AuthorPaper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @author_paper }
    end
  end

  # GET /author_papers/new
  # GET /author_papers/new.json
  def new
    @author_paper = AuthorPaper.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @author_paper }
    end
  end

  # GET /author_papers/1/edit
  def edit
    @author_paper = AuthorPaper.find(params[:id])
  end

  # POST /author_papers
  # POST /author_papers.json
  def create
    @author_paper = AuthorPaper.new(params[:author_paper])

    respond_to do |format|
      if @author_paper.save
        format.html { redirect_to @author_paper, :notice => 'Author paper was successfully created.' }
        format.json { render :json => @author_paper, :status => :created, :location => @author_paper }
      else
        format.html { render :action => "new" }
        format.json { render :json => @author_paper.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /author_papers/1
  # PUT /author_papers/1.json
  def update
    @author_paper = AuthorPaper.find(params[:id])

    respond_to do |format|
      if @author_paper.update_attributes(params[:author_paper])
        format.html { redirect_to @author_paper, :notice => 'Author paper was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @author_paper.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /author_papers/1
  # DELETE /author_papers/1.json
  def destroy
    @author_paper = AuthorPaper.find(params[:id])
    @author_paper.destroy

    respond_to do |format|
      format.html { redirect_to author_papers_url }
      format.json { head :no_content }
    end
  end
end
