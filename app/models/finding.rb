class Finding < ActiveRecord::Base
  belongs_to :task
  belongs_to :metric
  belongs_to :category

  belongs_to :relationship
  belongs_to :specificity

  has_many :finding_components
  has_many :components, :through => :finding_components

  attr_accessible :issue, :summary, :title, :category, :metric, :relationship, :specificity,
    :relationship_id, :specificity_id, :category_id, :metric_id, :component_ids
end
