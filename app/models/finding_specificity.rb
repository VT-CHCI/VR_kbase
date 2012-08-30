class FindingSpecificity < ActiveRecord::Base
  belongs_to :specificity
  belongs_to :finding
  # attr_accessible :title, :body
end
