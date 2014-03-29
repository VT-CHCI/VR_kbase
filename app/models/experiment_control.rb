class ExperimentControl < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :control_symmetry
  
  accepts_nested_attributes_for :control_symmetry

  attr_accessible :desc, :control_symmetry_attributes, :control_symmetry_id

  validates :desc, :presence => true
end
