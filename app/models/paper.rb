class Paper < ActiveRecord::Base
  has_many :author_papers
  has_many :authors, :through => :author_papers
  has_many :experiments, :dependent => :destroy
  has_many :paper_venues
  has_many :venues, :through => :paper_venues

  accepts_nested_attributes_for :authors
  accepts_nested_attributes_for :author_papers
  accepts_nested_attributes_for :experiments
  accepts_nested_attributes_for :venues

  attr_accessible :doi, :end_page, :num_views, :paper_url, :start_page, :title, :volume,
    :year, :issue, :venues_attributes, :experiments_attributes, :authors_attributes, 
    :author_papers_attributes, :tasks_attributes, :findings_attributes, :category_ids
end