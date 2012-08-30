class TaskScale < ActiveRecord::Base
  belongs_to :scale
  belongs_to :task
  # attr_accessible :title, :body
end
