class ValidateController < ApplicationController
  def papers
  	#@papers = Paper.where(:published => true).where(:validated => false).find(:all, :order => "updated_at DESC")
    @papers = Paper.where(:validated => false).find(:all, :order => "updated_at DESC")
  	
  	respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @papers }
    end
  end

  def components
    @auditories     = AuralFidelity.where(:validated => false).find(:all, :order => "updated_at DESC")
    @biomechanicals = BiomechanicalSymmetry.where(:validated => false).find(:all, :order => "updated_at DESC")
    @controls       = ControlSymmetry.where(:validated => false).find(:all, :order => "updated_at DESC")
    @haptics        = HapticFidelity.where(:validated => false).find(:all, :order => "updated_at DESC")
    @systemapps     = SystemAppropriateness.where(:validated => false).find(:all, :order => "updated_at DESC")
    @visuals        = VisualFidelity.where(:validated => false).find(:all, :order => "updated_at DESC")

    @papers_auditories     = Paper.joins( :experiments => :experiment_aurals ).where( :experiment_aurals => { :aural_fidelity_id => @auditories } )
    @papers_biomechanicals = Paper.joins( :experiments => :experiment_biomechanicals ).where( :experiment_biomechanicals => { :biomechanical_symmetry_id => @biomechanicals } )
    @papers_controls       = Paper.joins( :experiments => :experiment_controls ).where( :experiment_controls => { :control_symmetry_id => @controls } )
    @papers_haptics        = Paper.joins( :experiments => :experiment_haptics ).where( :experiment_haptics => { :haptic_fidelity_id => @haptics } )
    @papers_systemapps     = Paper.joins( :experiments => :experiment_system_apps ).where( :experiment_system_apps => { :system_appropriateness_id => @systemapps } )
    @papers_visuals        = Paper.joins( :experiments => :experiment_visuals ).where( :experiment_visuals => { :visual_fidelity_id => @visuals } )
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @papers }
    end
  end
  
  def systems
    @displays  = Display.where(:validated => false).find(:all, :order => "updated_at DESC")
    @hardwares = Hardware.where(:validated => false).find(:all, :order => "updated_at DESC")
    @softwares = Software.where(:validated => false).find(:all, :order => "updated_at DESC")

    @papers_displays  = Paper.joins( :experiments => :experiment_displays ).where( :experiment_displays => { :display_id => @displays } )
    @papers_hardwares = Paper.joins( :experiments => :experiment_hardwares ).where( :experiment_hardwares => { :hardware_id => @hardwares } )
    @papers_softwares = Paper.joins( :experiments => :experiment_softwares ).where( :experiment_softwares => { :software_id => @softwares } )
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @papers }
    end
  end
  
  def metrics 
    @metrics = Metric.where(:validated => false).find(:all, :order => "updated_at DESC")

    @papers_metrics = Paper.joins( :experiments => :metrics ).joins( :experiments => { :metrics => :task_metrics } ).where( :task_metrics => { :metric_id => @metrics } )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @papers }
    end
  end
  
  def indy_variables 
    @indy_variables = IndyVariable.where(:validated => false).find(:all, :order => "updated_at DESC")

    @papers_vars  = Paper.joins( :experiments => :experiment_indy_variables ).where( :experiment_indy_variables => { :indy_variable_id => @indy_variables } )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @papers }
    end
  end
  
  def categories
    @categories = Category.where(:validated => false).find(:all, :order => "updated_at DESC")

    @papers_categories = Paper.joins( :experiments => :tasks ).joins( :experiments => { :tasks => :task_categories } ).where( :task_categories => { :category_id => @categories } )
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @papers }
    end
  end
end
