class FindingCategoriesController < ApplicationController
  # GET /finding_categories
  # GET /finding_categories.json
  def index
    @finding_categories = FindingCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finding_categories }
    end
  end

  # GET /finding_categories/1
  # GET /finding_categories/1.json
  def show
    @finding_category = FindingCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finding_category }
    end
  end

  # GET /finding_categories/new
  # GET /finding_categories/new.json
  def new
    @finding_category = FindingCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finding_category }
    end
  end

  # GET /finding_categories/1/edit
  def edit
    @finding_category = FindingCategory.find(params[:id])
  end

  # POST /finding_categories
  # POST /finding_categories.json
  def create
    @finding_category = FindingCategory.new(params[:finding_category])

    respond_to do |format|
      if @finding_category.save
        format.html { redirect_to @finding_category, notice: 'Finding category was successfully created.' }
        format.json { render json: @finding_category, status: :created, location: @finding_category }
      else
        format.html { render action: "new" }
        format.json { render json: @finding_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finding_categories/1
  # PUT /finding_categories/1.json
  def update
    @finding_category = FindingCategory.find(params[:id])

    respond_to do |format|
      if @finding_category.update_attributes(params[:finding_category])
        format.html { redirect_to @finding_category, notice: 'Finding category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finding_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finding_categories/1
  # DELETE /finding_categories/1.json
  def destroy
    @finding_category = FindingCategory.find(params[:id])
    @finding_category.destroy

    respond_to do |format|
      format.html { redirect_to finding_categories_url }
      format.json { head :no_content }
    end
  end
end
