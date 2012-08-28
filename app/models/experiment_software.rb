class ExperimentSoftware < ActiveRecord::Base
  belongs_to :software
  belongs_to :experiment
  # attr_accessible :title, :body
end
