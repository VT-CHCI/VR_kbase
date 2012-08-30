class TaskDimension < ActiveRecord::Base
  belongs_to :dimension
  belongs_to :task
  # attr_accessible :title, :body
end
