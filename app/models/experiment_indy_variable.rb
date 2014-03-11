class ExperimentIndyVariable < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :indy_variable
  attr_accessible :desc
end
