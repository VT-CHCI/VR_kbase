class FindingComponent < ActiveRecord::Base
  belongs_to :finding
  belongs_to :component
  # attr_accessible :title, :body
end
