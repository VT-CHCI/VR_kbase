class TaskMetric < ActiveRecord::Base
  belongs_to :metric
  belongs_to :task
  # attr_accessible :title, :body
end
