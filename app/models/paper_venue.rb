class PaperVenue < ActiveRecord::Base
  belongs_to :paper
  belongs_to :venue

  # attr_accessible :title, :body
end
