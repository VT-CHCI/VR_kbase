class TaskMetric < ActiveRecord::Base
  belongs_to :metric
  belongs_to :task

  accepts_nested_attributes_for :metric

  attr_accessible :desc, :metric_attributes, :metric_id
end
