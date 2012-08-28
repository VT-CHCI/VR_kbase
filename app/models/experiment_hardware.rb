class ExperimentHardware < ActiveRecord::Base
  belongs_to :hardware
  belongs_to :experiment
  # attr_accessible :title, :body
end
