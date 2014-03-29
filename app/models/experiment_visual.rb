class ExperimentVisual < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :visual_fidelity
  
  accepts_nested_attributes_for :visual_fidelity

  attr_accessible :desc, :visual_fidelity_attributes, :visual_fidelity_id

  validates :desc, :presence => true
end
