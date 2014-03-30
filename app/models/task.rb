class Task < ActiveRecord::Base
  belongs_to :experiment
  has_many :findings, :dependent => :destroy

  belongs_to :dimension
  belongs_to :scale
  belongs_to :density
  belongs_to :realism

  has_many :task_categories, :dependent => :destroy
  has_many :categories, :through => :task_categories

  has_many :task_metrics, :dependent => :destroy
  has_many :metrics, :through => :task_metrics

  accepts_nested_attributes_for :task_metrics, :allow_destroy => true

  accepts_nested_attributes_for :findings, :allow_destroy => true
  
  attr_accessible :env_desc, :interface_desc, :task_desc, :title, :dimension_id, :scale_id, 
    :density_id, :realism_id, :findings, :findings_attributes, :category_ids, :task_metrics_attributes

  validates :title, :presence => true
  validates :task_desc, :presence => true
end
