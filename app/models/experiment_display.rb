class ExperimentDisplay < ActiveRecord::Base
  belongs_to :display
  belongs_to :experiment
  # attr_accessible :title, :body
end
