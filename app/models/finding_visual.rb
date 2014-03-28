class FindingVisual < ActiveRecord::Base
  belongs_to :finding
  belongs_to :visual_fidelity
  # attr_accessible :title, :body
end
