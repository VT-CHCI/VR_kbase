class ExperimentBiomechanical < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :biomechanical_symmetry
  attr_accessible :desc
end
