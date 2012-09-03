class Finding < ActiveRecord::Base
  belongs_to :task
  belongs_to :metric
  belongs_to :category

  attr_accessible :issue, :summary, :title, :category, :metric
end
