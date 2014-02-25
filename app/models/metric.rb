class Metric < ActiveRecord::Base
	has_many :task_metrics
  has_many :tasks, :through => :task_metric

  has_one :finding
  attr_accessible :metric
end
