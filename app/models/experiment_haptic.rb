class ExperimentHaptic < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :haptic_fidelity
  
  accepts_nested_attributes_for :haptic_fidelity

  attr_accessible :desc, :haptic_fidelity_attributes, :haptic_fidelity_id

  validates :desc, :presence => true
end
