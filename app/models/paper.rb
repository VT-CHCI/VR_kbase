class Paper < ActiveRecord::Base
	has_many :experiments, :dependent => :destroy
  accepts_nested_attributes_for :experiments
  attr_accessible :doi, :experiments, :num_pages, :num_views, :paper_url, :start_page, :title, :volume, :year
end
