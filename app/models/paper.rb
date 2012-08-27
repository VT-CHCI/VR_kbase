class Paper < ActiveRecord::Base
  has_many :author_papers
  has_many :authors, :through => :author_papers
  has_many :experiments, :dependent => :destroy
  has_one :venue

  accepts_nested_attributes_for :authors
  accepts_nested_attributes_for :experiments
  accepts_nested_attributes_for :venue

  attr_accessible :doi, :experiments, :num_pages, :num_views, :paper_url, :start_page, :title, :volume, :year
end
