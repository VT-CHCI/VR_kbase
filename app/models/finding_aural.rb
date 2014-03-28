class FindingAural < ActiveRecord::Base
  belongs_to :finding
  belongs_to :aural_fidelity
  # attr_accessible :title, :body
end
