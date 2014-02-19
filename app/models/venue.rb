class Venue < ActiveRecord::Base
  belongs_to :paper

  has_many :paper_venues
  has_many :papers, :through => :paper_venues
  
  accepts_nested_attributes_for :papers

  attr_reader :paper_tokens

  def paper_tokens=(ids)
    ids.gsub!(/CREATE_(.+?)_END/) do
      Category.create!(:paper_venue => $1).id
    end
    self.paper_ids = ids.split(",")
  end

  attr_accessible :accronym, :name, :paper_ids, :category_ids
end
