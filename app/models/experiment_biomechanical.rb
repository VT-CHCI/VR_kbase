class ExperimentBiomechanical < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :biomechanical_symmetry
  
  accepts_nested_attributes_for :biomechanical_symmetry

  attr_accessible :desc, :biomechanical_symmetry_attributes, :biomechanical_symmetry_id
end
