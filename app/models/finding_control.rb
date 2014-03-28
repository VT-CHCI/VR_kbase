class FindingControl < ActiveRecord::Base
  belongs_to :finding
  belongs_to :control_symmetry
  # attr_accessible :title, :body
end
