class LandingController < ApplicationController
  def index
  	@papers = Paper.find(:all)
  end
end
