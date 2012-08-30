class TaskDensity < ActiveRecord::Base
  belongs_to :density
  belongs_to :task
  # attr_accessible :title, :body
end
