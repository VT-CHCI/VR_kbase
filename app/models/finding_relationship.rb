class FindingRelationship < ActiveRecord::Base
  belongs_to :relationship
  belongs_to :finding
  # attr_accessible :title, :body
end
