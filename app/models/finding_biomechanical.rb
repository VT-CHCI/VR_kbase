class FindingBiomechanical < ActiveRecord::Base
  belongs_to :finding
  belongs_to :biomechanical_symmetry
  # attr_accessible :title, :body
end
