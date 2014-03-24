class ValidateController < ApplicationController
  def index
  	#@papers = Paper.where(:published => true).where(:validated => false).find(:all, :order => "updated_at DESC")
    @papers = Paper.where(:validated => false).find(:all, :order => "updated_at DESC")
  	
  	@auditories = AuralFidelity.where(:validated => false).find(:all, :order => "updated_at DESC")
  	@biomechanicals = BiomechanicalSymmetry.where(:validated => false).find(:all, :order => "updated_at DESC")
  	@controls = ControlSymmetry.where(:validated => false).find(:all, :order => "updated_at DESC")
  	@haptics = HapticFidelity.where(:validated => false).find(:all, :order => "updated_at DESC")
  	@systems = SystemAppropriateness.where(:validated => false).find(:all, :order => "updated_at DESC")
  	@visuals = VisualFidelity.where(:validated => false).find(:all, :order => "updated_at DESC")
  	
  	@displays = Display.where(:validated => false).find(:all, :order => "updated_at DESC")
  	@hardwares = Hardware.where(:validated => false).find(:all, :order => "updated_at DESC")
  	@softwares = Software.where(:validated => false).find(:all, :order => "updated_at DESC")
  	
  	@independents = IndyVariable.where(:validated => false).find(:all, :order => "updated_at DESC")
  	
  	@metrics = Metric.where(:validated => false).find(:all, :order => "updated_at DESC")

    @categories = Category.where(:validated => false).find(:all, :order => "updated_at DESC")
  	
  	respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @papers }
    end
  end
end
