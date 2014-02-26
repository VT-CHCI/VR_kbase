class Paper < ActiveRecord::Base
  has_many :author_papers
  has_many :authors, :through => :author_papers
  has_many :experiments, :dependent => :destroy
  has_one :paper_venue
  has_one :venue, :through => :paper_venue

  accepts_nested_attributes_for :authors
  accepts_nested_attributes_for :author_papers
  accepts_nested_attributes_for :experiments
  accepts_nested_attributes_for :venue

  attr_accessible :doi, :end_page, :num_views, :paper_url, :start_page, :title, :volume,
    :year, :issue, :venue_attributes, :experiments_attributes, :authors_attributes,
    :tasks_attributes, :findings_attributes, :paper_venues_attributes, :author_papers_attributes,
    :category_ids, :order
end