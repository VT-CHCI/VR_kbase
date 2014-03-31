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

  searchable do
    text :title#, :as => :title_textp

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
      ]} 

      # {:experiment_displays => {:include => [:display]}},
      # {:experiment_hardwares => {:include => [:hardware]}},
      # {:experiment_softwares=> {:include => [:software]}},
      # {:experiment_visuals => {:include => [:visual_fidelity]}},
      # {:experiment_aurals => {:include => [:aural_fidelity]}},
      # {:experiment_haptics => {:include => [:haptic_fidelity]}},
      # {:experiment_biomechanicals => {:include => [:biomechanical_symmetry]}},
      # {:experiment_controls => {:include => [:control_symmetry]}},
      # {:experiment_system_apps => {:include => [:system_appropriateness]}},
      # {:experiment_indy_variables => {:include => [:indy_variable]}},
    end
  end
end