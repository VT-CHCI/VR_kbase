class Task < ActiveRecord::Base
  belongs_to :experiment
  attr_accessible :env_desc, :interface_desc, :task_desc, :title
end
