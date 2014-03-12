class ExperimentAural < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :aural_fidelity
  attr_accessible :desc
end
