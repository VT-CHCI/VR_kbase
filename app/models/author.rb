class Author < ActiveRecord::Base
  has_many :author_papers
  has_many :papers, :through => :author_papers
  
  accepts_nested_attributes_for :author_papers
  
  attr_accessible :first_name, :last_name, :middle_initial, :order
end
