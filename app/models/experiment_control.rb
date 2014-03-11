class ExperimentControl < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :control_symmetry
  attr_accessible :desc
end
