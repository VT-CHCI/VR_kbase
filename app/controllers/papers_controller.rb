class PapersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  # GET /papers
  # GET /papers.json
  def index
    @papers = Paper.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @papers }
      
    end
  end

  # GET /papers/1
  # GET /papers/1.json
  def show
    @paper = Paper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      # format.json { render :json => @paper }
      format.json { render :json => @paper.to_json(
        :include => [
          {:author_papers => {:include => [:author]}},
          {:experiments => {
            :include => [
              {:experiment_displays => {:include => [:display]}},
              {:experiment_hardwares => {:include => [:hardware]}},
              {:experiment_softwares=> {:include => [:software]}},
              {:experiment_visuals => {:include => [:visual_fidelity]}},
              {:experiment_aurals => {:include => [:aural_fidelity]}},
              {:experiment_haptics => {:include => [:haptic_fidelity]}},
              {:experiment_biomechanicals => {:include => [:biomechanical_symmetry]}},
              {:experiment_controls => {:include => [:control_symmetry]}},
              {:experiment_system_apps => {:include => [:system_appropriateness]}},
              {:experiment_indy_variables => {:include => [:indy_variable]}},
              {:tasks => { 
                :include => [
                  {:task_categories => {:include => [:category]}},
                  {:task_metrics => {:include => [:metric]}},
                  :findings
                ]
              }}
            ]
          }}
        ]
      )}
    end
  end

  # GET /papers/new
  # GET /papers/new.json
  def new
    @paper = Paper.new
    @paper.venues.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @paper }
    end
  end

  # GET /papers/1/edit
  def edit
    @paper = Paper.find(params[:id])
  end

  # POST /papers
  # POST /papers.json
  def create
    @paper = Paper.new(params[:paper])

    respond_to do |format|
      if @paper.save
        format.html { redirect_to @paper, :notice => 'Paper was successfully created.' }
        # format.json { render :json => @paper, :status => :created, :location => @paper, :include => :author }
        format.json { render :json => @paper.to_json(
          :include => [
            {:author_papers => {:include => [:author]}},
            {:experiments => {
              :include => [
                {:experiment_displays => {:include => [:display]}},
                {:experiment_hardwares => {:include => [:hardware]}},
                {:experiment_softwares=> {:include => [:software]}},
                {:experiment_visuals => {:include => [:visual_fidelity]}},
                {:experiment_aurals => {:include => [:aural_fidelity]}},
                {:experiment_haptics => {:include => [:haptic_fidelity]}},
                {:experiment_biomechanicals => {:include => [:biomechanical_symmetry]}},
                {:experiment_controls => {:include => [:control_symmetry]}},
                {:experiment_system_apps => {:include => [:system_appropriateness]}},
                {:experiment_indy_variables => {:include => [:indy_variable]}},
                {:tasks => { 
                  :include => [
                    {:task_categories => {:include => [:category]}},
                    {:task_metrics => {:include => [:metric]}},
                    :findings
                  ]
                }}
              ]
            }}
          ]
        ), :status => :created, :location => @paper }
      else
        format.html { render :action => "new" }
        format.json { render :json => @paper.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /papers/1
  # PUT /papers/1.json
  def update
    @paper = Paper.find(params[:id])

    respond_to do |format|
      if @paper.update_attributes(params[:paper])
        format.html { redirect_to @paper, :notice => 'Paper was successfully updated.' }
        # format.json { head :no_content }
        format.json { render :json => @paper.to_json(
          :include => [
            {:author_papers => {:include => [:author]}},
            {:experiments => {
              :include => [
                {:experiment_displays => {:include => [:display]}},
                {:experiment_hardwares => {:include => [:hardware]}},
                {:experiment_softwares=> {:include => [:software]}},
                {:experiment_visuals => {:include => [:visual_fidelity]}},
                {:experiment_aurals => {:include => [:aural_fidelity]}},
                {:experiment_haptics => {:include => [:haptic_fidelity]}},
                {:experiment_biomechanicals => {:include => [:biomechanical_symmetry]}},
                {:experiment_controls => {:include => [:control_symmetry]}},
                {:experiment_system_apps => {:include => [:system_appropriateness]}},
                {:experiment_indy_variables => {:include => [:indy_variable]}},
                {:tasks => { 
                  :include => [
                    {:task_categories => {:include => [:category]}},
                    {:task_metrics => {:include => [:metric]}},
                    :findings
                  ]
                }}
              ]
            }}
          ]
        ), :status => :created, :location => @paper }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @paper.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.json
  def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy

    respond_to do |format|
      format.html { redirect_to papers_url }
      format.json { head :no_content }
    end
  end
end
