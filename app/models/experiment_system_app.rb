class ExperimentSystemApp < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :system_appropriateness
  attr_accessible :desc
end
