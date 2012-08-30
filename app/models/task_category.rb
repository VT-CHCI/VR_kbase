class TaskCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :task
  # attr_accessible :title, :body
end
