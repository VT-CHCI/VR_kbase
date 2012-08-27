class Venue < ActiveRecord::Base
  belongs_to :paper
  attr_accessible :accronym, :name
end
