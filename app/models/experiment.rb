class Experiment < ActiveRecord::Base
  belongs_to :paper
  has_many :tasks, :dependent => :destroy

  belongs_to :gender

  accepts_nested_attributes_for :tasks, :allow_destroy => true

  # validates_presence_of :title

  attr_accessible :comp_desc, :constants, :exp_desc, :other_vars, :part_age_max, :part_age_min,
    :part_background, :part_num, :display_desc, :system_desc, :tasks, :title, :gender_id,
    :software_tokens, :tasks_attributes, :findings_attributes, :component_ids, 
    :experiment_indy_variables_attributes, :category_ids, :experiment_displays_attributes, 
    :experiment_hardwares_attributes, :experiment_aurals_attributes, :experiment_visuals_attributes, 
    :experiment_haptics_attributes, :experiment_biomechanicals_attributes, :experiment_controls_attributes, 
    :experiment_system_apps_attributes

  validates :title, :presence => true
  validates :exp_desc, :presence => true

  has_many :experiment_displays, :dependent => :destroy
  has_many :displays, :through => :experiment_displays

  accepts_nested_attributes_for :experiment_displays, :allow_destroy => true

  has_many :experiment_hardwares, :dependent => :destroy
  has_many :hardwares, :through => :experiment_hardwares

  accepts_nested_attributes_for :experiment_hardwares, :allow_destroy => true

  has_many :experiment_softwares, :dependent => :destroy
  has_many :softwares, :through => :experiment_softwares

  attr_reader :software_tokens

  def software_tokens=(ids)
    ids.gsub!(/CREATE_(.+?)_END/) do
      Software.create!(:software => $1).id
    end
    self.software_ids = ids.split(",")
  end

  has_many :experiment_aurals, :dependent => :destroy
  has_many :aural_fidelities, :through => :experiment_aurals

  accepts_nested_attributes_for :experiment_aurals, :allow_destroy => true

  has_many :experiment_visuals, :dependent => :destroy
  has_many :visual_fidelities, :through => :experiment_visuals

  accepts_nested_attributes_for :experiment_visuals, :allow_destroy => true

  has_many :experiment_haptics, :dependent => :destroy
  has_many :haptic_fidelities, :through => :experiment_haptics

  accepts_nested_attributes_for :experiment_haptics, :allow_destroy => true

  has_many :experiment_biomechanicals, :dependent => :destroy
  has_many :biomechanical_symmetries, :through => :experiment_biomechanicals

  accepts_nested_attributes_for :experiment_biomechanicals, :allow_destroy => true

  has_many :experiment_controls, :dependent => :destroy
  has_many :control_symmetries, :through => :experiment_controls

  accepts_nested_attributes_for :experiment_controls, :allow_destroy => true

  has_many :experiment_system_apps, :dependent => :destroy
  has_many :system_appropriatenesses, :through => :experiment_system_apps

  accepts_nested_attributes_for :experiment_system_apps, :allow_destroy => true

  has_many :experiment_indy_variables, :dependent => :destroy
  has_many :indy_variables, :through => :experiment_indy_variables

  accepts_nested_attributes_for :experiment_indy_variables, :allow_destroy => true

end
