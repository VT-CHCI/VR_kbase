class BrowseController < ApplicationController
  def index
  	@search_paper = Paper.solr_search do 
  		fulltext params[:search]
      paginate :page => 1, :per_page => 2000
  	end
    @papers = @search_paper.results

    if params[:displays].present?
      @displays = params[:displays].split(/,/)
      @displays.each do |display|
        @papers = @papers.filter_display(display)
      end
    end

    # @papers_auditories     = Paper.joins( :experiments => :experiment_aurals ).where( :experiment_aurals => { :aural_fidelity_id => @auditories } )
    # @papers_biomechanicals = Paper.joins( :experiments => :experiment_biomechanicals ).where( :experiment_biomechanicals => { :biomechanical_symmetry_id => @biomechanicals } )
    # @papers_controls       = Paper.joins( :experiments => :experiment_controls ).where( :experiment_controls => { :control_symmetry_id => @controls } )
    # @papers_haptics        = Paper.joins( :experiments => :experiment_haptics ).where( :experiment_haptics => { :haptic_fidelity_id => @haptics } )
    # @papers_systemapps     = Paper.joins( :experiments => :experiment_system_apps ).where( :experiment_system_apps => { :system_appropriateness_id => @systemapps } )
    # @papers_visuals        = Paper.joins( :experiments => :experiment_visuals ).where( :experiment_visuals => { :visual_fidelity_id => @visuals } )
    # @papers_displays       = Paper.joins( :experiments => :experiment_displays ).where( :experiment_displays => { :display_id => @displays } )
    # @papers_hardwares      = Paper.joins( :experiments => :experiment_hardwares ).where( :experiment_hardwares => { :hardware_id => @hardwares } )
    # @papers_softwares      = Paper.joins( :experiments => :experiment_softwares ).where( :experiment_softwares => { :software_id => @softwares } )
    # @papers_metrics        = Paper.joins( :experiments => :metrics ).joins( :experiments => { :metrics => :task_metrics } ).where( :task_metrics => { :metric_id => @metrics } )
    # @papers_vars           = Paper.joins( :experiments => :experiment_indy_variables ).where( :experiment_indy_variables => { :indy_variable_id => @indy_variables } )
    # @papers_categories     = Paper.joins( :experiments => :tasks ).joins( :experiments => { :tasks => :task_categories } ).where( :task_categories => { :category_id => @categories } )

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
  end
end
