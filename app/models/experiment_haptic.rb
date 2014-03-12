class ExperimentHaptic < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :haptic_fidelity
  attr_accessible :desc
end
