class UserPapersController < ApplicationController
  # GET /user_papers
  # GET /user_papers.json
  def index
    @user_papers = UserPaper.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_papers }
    end
  end

  # GET /user_papers/1
  # GET /user_papers/1.json
  def show
    @user_paper = UserPaper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_paper }
    end
  end

  # GET /user_papers/new
  # GET /user_papers/new.json
  def new
    @user_paper = UserPaper.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_paper }
    end
  end

  # GET /user_papers/1/edit
  def edit
    @user_paper = UserPaper.find(params[:id])
  end

  # POST /user_papers
  # POST /user_papers.json
  def create
    @user_paper = UserPaper.new(params[:user_paper])

    respond_to do |format|
      if @user_paper.save
        format.html { redirect_to @user_paper, notice: 'User paper was successfully created.' }
        format.json { render json: @user_paper, status: :created, location: @user_paper }
      else
        format.html { render action: "new" }
        format.json { render json: @user_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_papers/1
  # PUT /user_papers/1.json
  def update
    @user_paper = UserPaper.find(params[:id])

    respond_to do |format|
      if @user_paper.update_attributes(params[:user_paper])
        format.html { redirect_to @user_paper, notice: 'User paper was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_papers/1
  # DELETE /user_papers/1.json
  def destroy
    @user_paper = UserPaper.find(params[:id])
    @user_paper.destroy

    respond_to do |format|
      format.html { redirect_to user_papers_url }
      format.json { head :no_content }
    end
  end
end
