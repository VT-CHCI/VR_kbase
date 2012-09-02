class Task < ActiveRecord::Base
  belongs_to :experiment


  belongs_to :dimension;

  has_many :task_categories
  has_many :categories, :through => :task_categories

  attr_reader :category_tokens

  def display_tokens=(ids)
    ids.gsub!(/CREATE_(.+?)_END/) do
      Category.create!(:task_category => $1).id
    end
    self.display_ids = ids.split(",")
  end

  attr_accessible :env_desc, :interface_desc, :task_desc, :title, :category_tokens, :dimension_id
end
