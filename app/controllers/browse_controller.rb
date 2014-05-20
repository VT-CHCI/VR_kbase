class BrowseController < ApplicationController
  def index
  	# search with sunspot
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

    @filtering = false
    @active_filters = []

    # apply display component filter to all papers (OR)
    @filtered_by_display_comps = []
    if params[:visualfidelity].present?
      params[:visualfidelity].each do |filter|
        @filtered_by_display_comps = @filtered_by_display_comps + Paper.filter_visual(filter)
      end
      @active_filters << 'Visual Fidelity' << params[:visualfidelity]
      @filtering = true
    end
    if params[:auditoryfidelity].present?
      params[:auditoryfidelity].split(/,/).each do |filter|
        @filtered_by_display_comps = @filtered_by_display_comps + Paper.filter_auditory(filter)
      end
      @active_filters << 'Auditory Fidelity' << params[:auditoryfidelity]
      @filtering = true
    end
    if params[:hapticfidelity].present?
      params[:hapticfidelity].split(/,/).each do |filter|
        @filtered_by_display_comps = @filtered_by_display_comps + Paper.filter_haptic(filter)
      end
      @active_filters << 'Haptic Fidelity' << params[:hapticfidelity]
      @filtering = true
    end
    @filtered_by_display_comps = @filtered_by_display_comps.uniq

    # apply interaction component filter to all papers (OR)
    @filtered_by_interaction_comps = []
    if params[:biomechanicalsimmetry].present?
      params[:biomechanicalsimmetry].split(/,/).each do |filter|
        @filtered_by_interaction_comps = @filtered_by_interaction_comps + Paper.filter_biomechanical(filter)
      end
      @active_filters << 'Biomechanical Simmetry' << params[:biomechanicalsimmetry]
      @filtering = true
    end
    if params[:controlsimmetry].present?
      params[:controlsimmetry].split(/,/).each do |filter|
        @filtered_by_interaction_comps = @filtered_by_interaction_comps + Paper.filter_control(filter)
      end
      @active_filters << 'Control Simmetry' << params[:controlsimmetry]
      @filtering = true
    end
    if params[:systemappropriateness].present?
      params[:systemappropriateness].split(/,/).each do |filter|
        @filtered_by_interaction_comps = @filtered_by_interaction_comps + Paper.filter_system_app(filter)
      end
      @active_filters << 'System Appropriateness' << params[:systemappropriateness]
      @filtering = true
    end
    @filtered_by_interaction_comps = @filtered_by_interaction_comps.uniq

    # apply task category filter to all papers (OR)
    @filtered_by_cats = []
    if params[:taskcategories].present?
      params[:taskcategories].each do |filter|
        @filtered_by_cats = @filtered_by_cats + Paper.filter_category(filter)
      end
      @active_filters << 'Task Categories' << params[:taskcategories]
      @filtering = true
    end
    @filtered_by_cats = @filtered_by_cats.uniq

    # apply visual display filter to all papers (OR)
    @filtered_by_disps = []
    if params[:visualdisplays].present?
      params[:visualdisplays].each do |filter|
        @filtered_by_disps = @filtered_by_disps + Paper.filter_display(filter)
      end
      @active_filters << 'Visual Displays' << params[:visualdisplays]
      @filtering = true
    end
    @filtered_by_comps = @filtered_by_disps.uniq

    # apply metric filter to all papers (OR)
    @filtered_by_mets = []
    if params[:metrics].present?
      params[:metrics].each do |filter|
        @filtered_by_mets = @filtered_by_mets + Paper.filter_metric(filter)
      end
      @active_filters << 'Metrics' << params[:metrics]
      @filtering = true
    end
    @filtered_by_mets = @filtered_by_mets.uniq

    # put all filters together, applying one by one if they have been selected (AND)
    if @filtering
      @filter_combo = Paper.all
      @filter_combo = @filter_combo & @filtered_by_display_comps if not @filtered_by_display_comps.empty?
      @filter_combo = @filter_combo & @filtered_by_interaction_comps if not @filtered_by_interaction_comps.empty?
      @filter_combo = @filter_combo & @filtered_by_cats if not @filtered_by_cats.empty?
      @filter_combo = @filter_combo & @filtered_by_disps if not @filtered_by_disps.empty?
      @filter_combo = @filter_combo & @filtered_by_mets if not @filtered_by_mets.empty?
      if @filter_combo == Paper.all
        @papers = []
      else
        @papers = @papers & @filter_combo
      end
      
    end

    # use set intersection to calculate which papers should be displayed
     #( @filtered_by_comps | @filtered_by_cats | @filtered_by_disps | @filtered_by_mets )

    # if we wanted to perform search again with experiments and findings
    #@search_experiment = Experiment.solr_search do 
    #  fulltext params[:search]
    #end
    #@experiments = @search_experiments.results
    #@search_finding = Finding.solr_search do 
    #  fulltext params[:search]
    #end
    #@findings = @search_findings.results

    # but we don't, because search has already been performed, so just get from paper
    @findings = []
    @experiments = []

    @papers.each do |paper|
      paper.experiments.each do |experiment|
        @experiments << experiment
        experiment.tasks.each do |task|
          task.findings.each do |finding|
            @findings << finding
          end
        end
      end
    end

    # this returns all available filters
    @filter_lists = []

    @filter_list_display_components = []
    @filter_list_display_components << 'Components of Display Fidelity'
    @filter_list_display_components << ['Visual Fidelity',VisualFidelity.all]
    @filter_list_display_components << ['Auditory Fidelity',AuralFidelity.all]
    @filter_list_display_components << ['Haptic Fidelity',HapticFidelity.all]
    @filter_lists << @filter_list_display_components

    @filter_list_interaction_components = []
    @filter_list_interaction_components << 'Components of Interaction Fidelity'
    @filter_list_interaction_components << ['Biomechanical Simmetry',BiomechanicalSymmetry.all]
    @filter_list_interaction_components << ['Control Simmetry',ControlSymmetry.all]
    @filter_list_interaction_components << ['System Appropriateness',SystemAppropriateness.all]
    @filter_lists << @filter_list_interaction_components

    @filter_list_categories = []
    @filter_list_categories << ['Task Categories',Category.all]
    @filter_lists << @filter_list_categories

    @filter_list_displays = []
    @filter_list_displays << ['Visual Displays',Display.all]
    @filter_lists << @filter_list_displays

    @filter_list_metrics = []
    @filter_list_metrics << ['Metrics',Metric.all]
    @filter_lists << @filter_list_metrics
  end
end
