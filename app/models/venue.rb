class Venue < ActiveRecord::Base
  has_many :paper_venues
  has_many :papers, :through => :paper_venues
  
  accepts_nested_attributes_for :paper_venues
  
  attr_accessible :accronym, :name
end
