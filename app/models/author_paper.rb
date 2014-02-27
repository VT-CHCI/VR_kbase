class AuthorPaper < ActiveRecord::Base
  belongs_to :author
  belongs_to :paper
  
  accepts_nested_attributes_for :author

  attr_accessible :order, :author_attributes
end
