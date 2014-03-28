class FindingCategory < ActiveRecord::Base
  belongs_to :finding
  belongs_to :category
  # attr_accessible :title, :body
end
