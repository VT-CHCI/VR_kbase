class Author < ActiveRecord::Base
	validates :first_name, :last_name, :presence => true

  has_many :author_papers
  has_many :papers, :through => :author_papers
  has_many :user_authors, :dependent => :destroy
  has_many :users, :through => :user_authors
  
  attr_accessible :first_name, :last_name, :middle_initial
end