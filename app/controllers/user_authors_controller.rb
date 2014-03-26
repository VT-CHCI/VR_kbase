class UserAuthorsController < ApplicationController
  # GET /user_authors
  # GET /user_authors.json
  def index
    @user_authors = UserAuthor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_authors }
    end
  end

  # GET /user_authors/1
  # GET /user_authors/1.json
  def show
    @user_author = UserAuthor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_author }
    end
  end

  # GET /user_authors/new
  # GET /user_authors/new.json
  def new
    @user_author = UserAuthor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_author }
    end
  end

  # GET /user_authors/1/edit
  def edit
    @user_author = UserAuthor.find(params[:id])
  end

  # POST /user_authors
  # POST /user_authors.json
  def create
    @user_author = UserAuthor.new(params[:user_author])

    respond_to do |format|
      if @user_author.save
        format.html { redirect_to @user_author, notice: 'User author was successfully created.' }
        format.json { render json: @user_author, status: :created, location: @user_author }
      else
        format.html { render action: "new" }
        format.json { render json: @user_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_authors/1
  # PUT /user_authors/1.json
  def update
    @user_author = UserAuthor.find(params[:id])

    respond_to do |format|
      if @user_author.update_attributes(params[:user_author])
        format.html { redirect_to @user_author, notice: 'User author was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_authors/1
  # DELETE /user_authors/1.json
  def destroy
    @user_author = UserAuthor.find(params[:id])
    @user_author.destroy

    respond_to do |format|
      format.html { redirect_to user_authors_url }
      format.json { head :no_content }
    end
  end
end
