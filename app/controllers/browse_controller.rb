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

    # apply component filter to all papers
    @filtered_by_comps = []
    if params[:auditories].present?
      params[:auditories].split(/,/).each do |filter|
        @filtered_by_comps = @filtered_by_comps + Paper.filter_auditory(filter)
      end
      @filtering = true
    end
    if params[:biomechanicals].present?
      params[:biomechanicals].split(/,/).each do |filter|
        @filtered_by_comps = @filtered_by_comps + Paper.filter_biomechanical(filter)
      end
      @filtering = true
    end
    if params[:controls].present?
      params[:controls].split(/,/).each do |filter|
        @filtered_by_comps = @filtered_by_comps + Paper.filter_control(filter)
      end
      @filtering = true
    end
    if params[:haptics].present?
      params[:haptics].split(/,/).each do |filter|
        @filtered_by_comps = @filtered_by_comps + Paper.filter_haptic(filter)
      end
      @filtering = true
    end
    if params[:system_apps].present?
      params[:system_apps].split(/,/).each do |filter|
        @filtered_by_comps = @filtered_by_comps + Paper.filter_system_app(filter)
      end
      @filtering = true
    end
    if params[:visuals].present?
      params[:visuals].split(/,/).each do |filter|
        @filtered_by_comps = @filtered_by_comps + Paper.filter_visual(filter)
      end
      @filtering = true
    end
    @filtered_by_comps = @filtered_by_comps.uniq

    # apply task category filter to all papers
    @filtered_by_cats = []
    if params[:category].present?
      params[:category].split(/,/).each do |filter|
        @filtered_by_cats = @filtered_by_cats + Paper.filter_category(filter)
      end
      @filtering = true
    end
    @filtered_by_cats = @filtered_by_cats.uniq

    # apply component filter to all papers
    @filtered_by_disps = []
    if params[:displays].present?
      params[:displays].split(/,/).each do |filter|
        @filtered_by_disps = @filtered_by_disps + Paper.filter_display(filter)
      end
      @filtering = true
    end
    @filtered_by_comps = @filtered_by_disps.uniq

    # apply metric filter to all papers
    @filtered_by_mets = []
    if params[:metric].present?
      params[:metric].split(/,/).each do |filter|
        @filtered_by_mets = @filtered_by_mets + Paper.filter_metric(filter)
      end
      @filtering = true
    end
    @filtered_by_mets = @filtered_by_mets.uniq

    if @filtering
      @filter_combo = Paper.all
      @filter_combo = @filter_combo & @filtered_by_comps if not @filtered_by_comps.empty?
      @filter_combo = @filter_combo & @filtered_by_cats if not @filtered_by_cats.empty?
      @filter_combo = @filter_combo & @filtered_by_disps if not @filtered_by_disps.empty?
      @filter_combo = @filter_combo & @filtered_by_mets if not @filtered_by_mets.empty?
      @papers = @papers & @filter_combo
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

    # filter lists 
    @filter_list_components = []
    @filter_list_components << ['Auditory Fidelity',AuralFidelity.all]
    @filter_list_components << ['Haptic Fidelity',HapticFidelity.all]
    @filter_list_components << ['Visual Fidelity',HapticFidelity.all]
    @filter_list_components << ['Biomechanical Simmetry',BiomechanicalSymmetry.all]
    @filter_list_components << ['Control Simmetry',ControlSymmetry.all]
    @filter_list_components << ['System Appropriateness',SystemAppropriateness.all]

    @filter_list_categories = []
    @filter_list_categories << [nil,Category.all]

    @filter_list_displays = []
    @filter_list_displays << [nil,Display.all]

    @filter_list_metrics = []
    @filter_list_metrics << [nil,Metric.all]
  end
end
