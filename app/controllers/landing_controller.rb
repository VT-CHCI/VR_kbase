class LandingController < ApplicationController
  def index
  	@papers = Paper.find(:all, :order => "updated_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @papers }
    end
  end

  def faq
    respond_to do |format|
      format.html # faq.html.erb
    end
  end
end
