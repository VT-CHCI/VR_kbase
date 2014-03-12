class ExperimentSystemApp < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :system_appropriateness
  
  accepts_nested_attributes_for :system_appropriateness

  attr_accessible :desc, :system_appropriateness_attributes, :system_appropriateness_id
end
