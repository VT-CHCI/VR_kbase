class ExperimentGender < ActiveRecord::Base
  belongs_to :gender
  belongs_to :experiment
  # attr_accessible :title, :body
end
