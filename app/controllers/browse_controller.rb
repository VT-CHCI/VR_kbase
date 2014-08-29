class BrowseController < ApplicationController
  def index
    #####################
  	# search with sunspot
    # first we search on paper
    @search_paper = Paper.solr_search do 
  		fulltext params[:search]
      paginate :page => 1, :per_page => 2000
  	end
    @search_results = @search_paper.results

    # copy search results to list so we can use set intersection 
    @papers = []
    @search_results.each do |paper|
      @papers << paper
    end

    # then we do findings, because we only want findings related to search
    @search_finding = Finding.solr_search do 
      fulltext params[:search]
    end
    @search_results = @search_finding.results
    
    # copy search results to list so we can use set intersection 
    @findings = []
    @search_results.each do |finding|
      @findings << finding
    end

    # we could also do the same on experiments, but need to implement searchable there

    # an alternative is to use the search results from paper and just get their findings, 
    # but this results in more findings than we want
    # @findings = []
    # @experiments = []

    # @papers.each do |paper|
    #   paper.experiments.each do |experiment|
    #     @experiments << experiment
    #     experiment.tasks.each do |task|
    #       task.findings.each do |finding|
    #         @findings << finding
    #       end
    #     end
    #   end
    # end

    #####################
    # filtering with scope
    @filtering = false
    @active_filters = []

    # apply display component filter to all papers/findings (OR)
    @paper_filtered_by_display_comps = []
    @finding_filtered_by_display_comps = []
    if params[:visualfidelity].present?
      params[:visualfidelity].each do |filter|
        @paper_filtered_by_display_comps = @paper_filtered_by_display_comps + Paper.filter_visual(filter)
        @finding_filtered_by_display_comps = @finding_filtered_by_display_comps + Finding.filter_visual(filter)
      end
      @active_filters << 'Visual Fidelity' << params[:visualfidelity]
      @filtering = true
    end
    if params[:auditoryfidelity].present?
      params[:auditoryfidelity].each do |filter|
        @paper_filtered_by_display_comps = @paper_filtered_by_display_comps + Paper.filter_auditory(filter)
        @finding_filtered_by_display_comps = @finding_filtered_by_display_comps + Finding.filter_auditory(filter)
      end
      @active_filters << 'Auditory Fidelity' << params[:auditoryfidelity]
      @filtering = true
    end
    if params[:hapticfidelity].present?
      params[:hapticfidelity].each do |filter|
        @paper_filtered_by_display_comps = @paper_filtered_by_display_comps + Paper.filter_haptic(filter)
        @finding_filtered_by_display_comps = @finding_filtered_by_display_comps + Finding.filter_haptic(filter)
      end
      @active_filters << 'Haptic Fidelity' << params[:hapticfidelity]
      @filtering = true
    end
    @paper_filtered_by_display_comps = @paper_filtered_by_display_comps.uniq
    @finding_filtered_by_display_comps = @finding_filtered_by_display_comps.uniq

    # apply interaction component filter to all papers/findings (OR)
    @paper_filtered_by_interaction_comps = []
    @finding_filtered_by_interaction_comps = []
    if params[:biomechanicalsimmetry].present?
      params[:biomechanicalsimmetry].each do |filter|
        @paper_filtered_by_interaction_comps = @paper_filtered_by_interaction_comps + Paper.filter_biomechanical(filter)
        @finding_filtered_by_interaction_comps = @finding_filtered_by_interaction_comps + Finding.filter_biomechanical(filter)
      end
      @active_filters << 'Biomechanical Simmetry' << params[:biomechanicalsimmetry]
      @filtering = true
    end
    if params[:controlsimmetry].present?
      params[:controlsimmetry].each do |filter|
        @paper_filtered_by_interaction_comps = @paper_filtered_by_interaction_comps + Paper.filter_control(filter)
        @finding_filtered_by_interaction_comps = @finding_filtered_by_interaction_comps + Finding.filter_control(filter)
      end
      @active_filters << 'Control Simmetry' << params[:controlsimmetry]
      @filtering = true
    end
    if params[:systemappropriateness].present?
      params[:systemappropriateness].each do |filter|
        @paper_filtered_by_interaction_comps = @paper_filtered_by_interaction_comps + Paper.filter_system_app(filter)
        @finding_filtered_by_interaction_comps = @finding_filtered_by_interaction_comps + Finding.filter_system_app(filter)
      end
      @active_filters << 'System Appropriateness' << params[:systemappropriateness]
      @filtering = true
    end
    @paper_filtered_by_interaction_comps = @paper_filtered_by_interaction_comps.uniq
    @finding_filtered_by_interaction_comps = @finding_filtered_by_interaction_comps.uniq

    # apply task category filter to all papers (OR)
    @paper_filtered_by_cats = []
    @finding_filtered_by_cats = []
    if params[:taskcategories].present?
      params[:taskcategories].each do |filter|
        @paper_filtered_by_cats = @paper_filtered_by_cats + Paper.filter_category(filter)
        @finding_filtered_by_cats = @finding_filtered_by_cats + Finding.filter_category(filter)
      end
      @active_filters << 'Task Categories' << params[:taskcategories]
      @filtering = true
    end
    @paper_filtered_by_cats = @paper_filtered_by_cats.uniq
    @finding_filtered_by_cats = @finding_filtered_by_cats.uniq

    # apply visual display filter to all papers (OR)
    @paper_filtered_by_disps = []
    @finding_filtered_by_disps = []
    if params[:visualdisplays].present?
      params[:visualdisplays].each do |filter|
        @paper_filtered_by_disps = @paper_filtered_by_disps + Paper.filter_display(filter)
        @finding_filtered_by_disps = @finding_filtered_by_disps + Finding.filter_display(filter)
      end
      @active_filters << 'Visual Displays' << params[:visualdisplays]
      @filtering = true
    end
    @paper_filtered_by_comps = @paper_filtered_by_disps.uniq
    @finding_filtered_by_comps = @finding_filtered_by_disps.uniq

    # apply metric filter to all papers (OR)
    @paper_filtered_by_mets = []
    @finding_filtered_by_mets = []
    if params[:metrics].present?
      params[:metrics].each do |filter|
        @paper_filtered_by_mets = @paper_filtered_by_mets + Paper.filter_metric(filter)
        @finding_filtered_by_mets = @finding_filtered_by_mets + Finding.filter_metric(filter)
      end
      @active_filters << 'Metrics' << params[:metrics]
      @filtering = true
    end
    @paper_filtered_by_mets = @paper_filtered_by_mets.uniq
    @finding_filtered_by_mets = @finding_filtered_by_mets.uniq

    # use set intersection to figure out which papers should be displayed (AND)
    # e.g., ( @paper_filtered_by_comps & @paper_filtered_by_cats & @paper_filtered_by_disps & @paper_filtered_by_mets )
    if @filtering
      # combining paper filters
      @filter_combo = Paper.all
      @filter_combo = @filter_combo & @paper_filtered_by_display_comps if not @paper_filtered_by_display_comps.empty?
      @filter_combo = @filter_combo & @paper_filtered_by_interaction_comps if not @paper_filtered_by_interaction_comps.empty?
      @filter_combo = @filter_combo & @paper_filtered_by_cats if not @paper_filtered_by_cats.empty?
      @filter_combo = @filter_combo & @paper_filtered_by_disps if not @paper_filtered_by_disps.empty?
      @filter_combo = @filter_combo & @paper_filtered_by_mets if not @paper_filtered_by_mets.empty?
      if @filter_combo == Paper.all
        @papers = []
      else
        @papers = @papers & @filter_combo
      end

      # combining finding filters
      @filter_combo = Finding.all
      @filter_combo = @filter_combo & @finding_filtered_by_display_comps if not @finding_filtered_by_display_comps.empty?
      @filter_combo = @filter_combo & @finding_filtered_by_interaction_comps if not @finding_filtered_by_interaction_comps.empty?
      @filter_combo = @filter_combo & @finding_filtered_by_cats if not @finding_filtered_by_cats.empty?
      @filter_combo = @filter_combo & @finding_filtered_by_disps if not @finding_filtered_by_disps.empty?
      @filter_combo = @filter_combo & @finding_filtered_by_mets if not @finding_filtered_by_mets.empty?
      if @filter_combo == Finding.all
        @findings = []
      else
        @findings = @findings & @filter_combo
      end
      
    end

    #####################
    # returns all available filters
    @filter_lists = []

    @filter_list_display_components = []
    @filter_list_display_components << 'Components of Display Fidelity'
    @filter_list_display_components << ['Visual Fidelity',VisualFidelity.order(:component)]
    @filter_list_display_components << ['Auditory Fidelity',AuralFidelity.order(:component)]
    @filter_list_display_components << ['Haptic Fidelity',HapticFidelity.order(:component)]
    @filter_lists << @filter_list_display_components

    @filter_list_interaction_components = []
    @filter_list_interaction_components << 'Components of Interaction Fidelity'
    @filter_list_interaction_components << ['Biomechanical Symmetry',BiomechanicalSymmetry.order(:component)]
    @filter_list_interaction_components << ['Control Symmetry',ControlSymmetry.order(:component)]
    @filter_list_interaction_components << ['System Appropriateness',SystemAppropriateness.order(:component)]
    @filter_lists << @filter_list_interaction_components

    @filter_list_categories = []
    @filter_list_categories << ['Task Categories',Category.order(:task_category)]
    @filter_lists << @filter_list_categories

    @filter_list_displays = []
    @filter_list_displays << ['Visual Displays',Display.order(:display)]
    @filter_lists << @filter_list_displays

    @filter_list_metrics = []
    @filter_list_metrics << ['Metrics',Metric.order(:metric)]
    @filter_lists << @filter_list_metrics
  end
end
