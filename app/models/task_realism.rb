class TaskRealism < ActiveRecord::Base
  belongs_to :realism
  belongs_to :task
  # attr_accessible :title, :body
end
