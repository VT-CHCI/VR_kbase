class FindingComponent < ActiveRecord::Base
  belongs_to :component
  belongs_to :finding
  # attr_accessible :title, :body
end
