class Task < ActiveRecord::Base
  belongs_to :experiment
  has_many :findings, :dependent => :destroy

  belongs_to :dimension
  belongs_to :scale
  belongs_to :density
  belongs_to :realism

  has_many :task_categories, :dependent => :destroy
  has_many :categories, :through => :task_categories

  attr_reader :category_tokens

  def category_tokens=(ids)
    ids.gsub!(/CREATE_(.+?)_END/) do
      Category.create!(:task_category => $1).id
    end
    self.category_ids = ids.split(",")
  end

  has_many :task_metrics, :dependent => :destroy
  has_many :metrics, :through => :task_metrics

  attr_reader :metric_tokens

  def metric_tokens=(ids)
    ids.gsub!(/CREATE_(.+?)_END/) do
      Metric.create!(:metric => $1).id
    end
    self.metric_ids = ids.split(",")
  end

  accepts_nested_attributes_for :findings
  attr_accessible :env_desc, :interface_desc, :task_desc, :title, :dimension_id, :scale_id, 
    :density_id, :realism_id, :category_tokens, :metric_tokens, :findings, :findings_attributes, 
    :metric_ids, :category_ids
end
