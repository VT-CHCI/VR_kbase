class ExperimentComponent < ActiveRecord::Base
  belongs_to :component
  belongs_to :experiment
  # attr_accessible :title, :body
end
