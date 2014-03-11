class ExperimentVisual < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :visual_fidelity
  attr_accessible :desc
end
