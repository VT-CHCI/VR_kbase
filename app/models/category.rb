class Category < ActiveRecord::Base
  has_many :task_categories
  has_many :tasks, :through => :task_category

  has_one :finding

  attr_accessible :task_category
end
