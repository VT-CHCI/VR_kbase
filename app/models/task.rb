class Task < ActiveRecord::Base
  belongs_to :experiment

  belongs_to :dimension
  belongs_to :scale
  belongs_to :density
  belongs_to :realism

  has_many :task_categories
  has_many :categories, :through => :task_categories

  attr_reader :category_tokens

  def category_tokens=(ids)
    ids.gsub!(/CREATE_(.+?)_END/) do
      Category.create!(:task_category => $1).id
    end
    self.category_ids = ids.split(",")
  end

  attr_accessible :env_desc, :interface_desc, :task_desc, :title, :category_tokens, :dimension_id, :scale_id, 
    :density_id, :realism_id
end
