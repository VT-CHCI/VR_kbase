class Finding < ActiveRecord::Base
  belongs_to :task
  belongs_to :metric

  belongs_to :relationship
  belongs_to :specificity

	has_many :finding_aurals, :dependent => :destroy
  has_many :aural_fidelities, :through => :finding_aurals

  has_many :finding_visuals, :dependent => :destroy
  has_many :visual_fidelities, :through => :finding_visuals

  has_many :finding_haptics, :dependent => :destroy
  has_many :haptic_fidelities, :through => :finding_haptics

  has_many :finding_biomechanicals, :dependent => :destroy
  has_many :biomechanical_symmetries, :through => :finding_biomechanicals

  has_many :finding_controls, :dependent => :destroy
  has_many :control_symmetries, :through => :finding_controls

  has_many :finding_system_apps, :dependent => :destroy
  has_many :system_appropriatenesses, :through => :finding_system_apps

  has_many :finding_categories, :dependent => :destroy
  has_many :categories, :through => :finding_categories

  has_many :finding_indy_variables, :dependent => :destroy
  has_many :indy_variables, :through => :finding_indy_variables

  attr_accessible :issue, :summary, :title, :category, :metric, :relationship, :specificity,
    :relationship_id, :specificity_id, :metric_id, :finding_note, :category_ids, :aural_fidelity_ids,
    :visual_fidelity_ids, :haptic_fidelity_ids, :biomechanical_symmetry_ids, :control_symmetry_ids,
    :system_appropriateness_ids, :indy_variable_ids

  validates :title, :presence => true
  validates :summary, :presence => true

  # scope functions for components
  scope :filter_auditory, lambda { |component|
    joins( :aural_fidelities ).where( :aural_fidelities => { :component => component } )
  }
  scope :filter_biomechanical, lambda { |component|
    joins( :biomechanical_symmetries ).where( :biomechanical_symmetries => { :component => component } )
  }
  scope :filter_control, lambda { |component|
    joins( :control_symmetries ).where( :control_symmetries => { :component => component } )
  }
  scope :filter_haptic, lambda { |component|
    joins( :haptic_fidelities ).where( :haptic_fidelities => { :component => component } )
  }
  scope :filter_system_app, lambda { |component|
    joins( :system_appropriatenesses ).where( :system_appropriatenesses => { :component => component } )
  }
  scope :filter_visual, lambda { |component|
    joins( :visual_fidelities ).where( :visual_fidelities => { :component => component } )
  }
  # scope function for task category
  scope :filter_category, lambda { |category|
    joins( :categories ).where( :categories => { :task_category => category } )
  }
  # scope function for display
  scope :filter_display, lambda { |display|
    joins( :task => :experiment ).joins( :task => { :experiment => :experiment_displays } ).joins( :task => { :experiment => { :experiment_displays => :display } } ).where( :displays => { :display => display } )
  }
  # scope function for metric
  scope :filter_metric, lambda { |metric|
    joins( :metric ).where( :metrics => { :metric => metric } )
  }

  searchable do
    text :title, :summary, :issue, :finding_note

    text :aural_fidelities do
      aural_fidelities.map { |finding| [ \
        finding.component \
      ]}
    end

    text :visual_fidelities do
      visual_fidelities.map { |finding| [ \
        finding.component \
      ]}
    end

    text :haptic_fidelities do
      haptic_fidelities.map { |finding| [ \
        finding.component \
      ]}
    end

    text :biomechanical_symmetries do
      biomechanical_symmetries.map { |finding| [ \
        finding.component \
      ]}
    end

    text :control_symmetries do
      control_symmetries.map { |finding| [ \
        finding.component \
      ]}
    end

    text :system_appropriatenesses do
      system_appropriatenesses.map { |finding| [ \
        finding.component \
      ]}
    end

    text :categories do
      categories.map { |finding| [ \
        finding.task_category \
      ]}
    end

    text :indy_variables do
      indy_variables.map { |finding| [ \
        finding.variable \
      ]}
    end

    text :metric do
      metric.metric if metric
    end
  end
end
