class PaperVenue < ActiveRecord::Base
  belongs_to :paper
  belongs_to :venue

  accepts_nested_attributes_for :venue
  # attr_accessible :title, :body
end
