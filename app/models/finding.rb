class Finding < ActiveRecord::Base
  belongs_to :task
  belongs_to :metric
  belongs_to :category

  belongs_to :relationship
  belongs_to :specificity

  attr_accessible :issue, :summary, :title, :category, :metric, :relationship, :specificity,
    :relationship_id, :specificity_id, :category_id
end
