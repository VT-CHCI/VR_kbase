class PaperVenue < ActiveRecord::Base
  belongs_to :venue
  belongs_to :paper
  # attr_accessible :title, :body
end
