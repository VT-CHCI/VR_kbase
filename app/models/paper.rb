class Paper < ActiveRecord::Base
  has_many :author_papers, :dependent => :destroy
  has_many :authors, :through => :author_papers
  has_many :experiments, :dependent => :destroy
  has_many :paper_venues, :dependent => :destroy
  has_many :venues, :through => :paper_venues, :autosave => true
  has_many :user_papers, :dependent => :destroy
  has_many :users, :through => :user_papers

  accepts_nested_attributes_for :author_papers, :allow_destroy => true
  accepts_nested_attributes_for :experiments, :allow_destroy => true
  accepts_nested_attributes_for :venues
  accepts_nested_attributes_for :users

  attr_accessible :doi, :end_page, :num_views, :paper_url, :start_page, :title, :volume,
    :year, :issue, :venues_attributes, :experiments_attributes, :author_papers_attributes, 
    :tasks_attributes, :findings_attributes, :users_attributes, :category_ids, :published

  validates :title, :presence => true
  validates :paper_url, :url => {:allow_blank => true}

  # If you need to validate the associated record, you can add a method like this:
  #     validate_associated_record_for_venue
  def autosave_associated_records_for_venues
    existing_venues = []
    new_venues = []
    # Find or create the venue by name, should always end up with one existing or one new
    venues.each do |venue|
      if existing_venue = Venue.find_by_name(venue.name)
        existing_venues << existing_venue
        self.venues = existing_venues
      else
        tmp = Venue.new
        tmp.name = venue.name
        tmp.accronym = venue.accronym
        new_venues << tmp
        self.venues = new_venues
        self.paper_venues[0].venue_id = self.venues[0].id # we can do this since we know we only have one venue
      end
    end
    # append two lists to use one new venue or one existing venue
    #self.venues = new_venues + existing_venues
  end

  # scope functions for components
  scope :filter_auditory, lambda { |component|
    joins( :experiments => :experiment_aurals ).joins( :experiments => { :experiment_aurals => :aural_fidelity } ).where( :aural_fidelities => { :component => component } )
  }
  scope :filter_biomechanical, lambda { |component|
    joins( :experiments => :experiment_biomechanicals ).joins( :experiments => { :experiment_biomechanicals => :biomechanical_symmetry } ).where( :biomechanical_symmetries => { :component => component } )
  }
  scope :filter_control, lambda { |component|
    joins( :experiments => :experiment_controls ).joins( :experiments => { :experiment_controls => :control_symmetry } ).where( :control_symmetries => { :component => component } )
  }
  scope :filter_haptic, lambda { |component|
    joins( :experiments => :experiment_haptics ).joins( :experiments => { :experiment_haptics => :haptic_fidelity } ).where( :haptic_fidelities => { :component => component } )
  }
  scope :filter_system_app, lambda { |component|
    joins( :experiments => :experiment_system_apps ).joins( :experiments => { :experiment_system_apps => :system_appropriateness } ).where( :system_appropriatenesses => { :component => component } )
  }
  scope :filter_visual, lambda { |component|
    joins( :experiments => :experiment_visuals ).joins( :experiments => { :experiment_visuals => :visual_fidelity } ).where( :visual_fidelities => { :component => component } )
  }
  # scope function for task category
  scope :filter_category, lambda { |category|
   joins( :experiments => :tasks ).joins( :experiments => { :tasks => :categories } ).where( :categories => { :task_category => category } )
  }
  # scope function for display
  scope :filter_display, lambda { |display|
    joins( :experiments => :experiment_displays ).joins( :experiments => { :experiment_displays => :display } ).where( :displays => { :display => display } )
  }
  # scope function for metric
  scope :filter_metric, lambda { |metric|
    joins( :experiments => :metrics ).joins( :experiments => { :metrics => :task_metrics } ).where( :metrics => { :metric => metric } )
  }
  
  searchable do
    text :title

    text :authors do
      authors.map { |author| [ \
        author.first_name, \
        author.last_name, \
        author.middle_initial \
      ]}
    end

    text :experiments do
      experiments.map { |experiment| [ \
        experiment.title, \
        experiment.exp_desc, \
        experiment.system_desc, \
        experiment.other_vars, \
        experiment.constants, \
        experiment.comp_desc, \
        experiment.display_desc, \
        experiment.tasks.map { |task| [ \
          task.title, \
          task.task_desc, \
          task.interface_desc, \
          task.env_desc, \
          task.findings.map { |finding| [ \
            finding.title, \
            finding.summary, \
            finding.issue, \
            finding.finding_note, \
            finding.specificity ? finding.specificity.level : nil \
          ]}, \
          task.task_categories.map { |task_category| [ \
            task_category.category ? task_category.category.task_category : nil \
          ]}, \
          task.task_metrics.map { |task_metric| [ \
            task_metric.metric ? task_metric.metric.metric : nil \
          ]} \
        ]}, \
        experiment.experiment_displays.map { |experiment_display| [ \
          experiment_display.desc, \
          experiment_display.display ? experiment_display.display.display : nil \
        ]}, \
        experiment.experiment_hardwares.map { |experiment_hardware| [ \
          experiment_hardware.desc, \
          experiment_hardware.hardware ? experiment_hardware.hardware.hardware : nil \
        ]}, \
        experiment.experiment_softwares.map { |experiment_software| [ \
          experiment_software.software ? experiment_software.software.software : nil \
        ]}, \
        experiment.experiment_visuals.map { |experiment_visual| [ \
          experiment_visual.desc, \
          experiment_visual.visual_fidelity ? experiment_visual.visual_fidelity.component : nil \
        ]}, \
        experiment.experiment_aurals.map { |experiment_aural| [ \
          experiment_aural.desc, \
          experiment_aural.aural_fidelity ? experiment_aural.aural_fidelity.component : nil \
        ]}, \
        experiment.experiment_haptics.map { |experiment_haptic| [ \
          experiment_haptic.desc, \
          experiment_haptic.haptic_fidelity ? experiment_haptic.haptic_fidelity.component : nil \
        ]}, \
        experiment.experiment_biomechanicals.map { |experiment_biomechanical| [ \
          experiment_biomechanical.desc, \
          experiment_biomechanical.biomechanical_symmetry ? experiment_biomechanical.biomechanical_symmetry.component : nil \
        ]}, \
        experiment.experiment_controls.map { |experiment_control| [ \
          experiment_control.desc, \
          experiment_control.control_symmetry ? experiment_control.control_symmetry.component : nil \
        ]}, \
        experiment.experiment_system_apps.map { |experiment_system_app| [ \
          experiment_system_app.desc, \
          experiment_system_app.system_appropriateness ? experiment_system_app.system_appropriateness.component : nil \
        ]}, \
        experiment.experiment_indy_variables.map { |experiment_indy_variable| [ \
          experiment_indy_variable.desc, \
          experiment_indy_variable.indy_variable ? experiment_indy_variable.indy_variable.variable : nil \
        ]} \
      ]} 
    end
  end
end