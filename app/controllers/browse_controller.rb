class BrowseController < ApplicationController
  def index
  	@search_paper = Paper.solr_search do 
  		fulltext params[:search]
      paginate :page => 1, :per_page => 200
  	end
    @papers = @search_paper.results

    #@search_experiment = Experiment.solr_search do 
    #  fulltext params[:search]
    #end
    #@experiments = @search_experiments.results

    #@search_finding = Finding.solr_search do 
    #  fulltext params[:search]
    #end
    #@findings = @search_findings.results
  end
end
