class ExperimentAural < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :aural_fidelity

  accepts_nested_attributes_for :aural_fidelity

  attr_accessible :desc, :aural_fidelity_attributes, :aural_fidelity_id
end
