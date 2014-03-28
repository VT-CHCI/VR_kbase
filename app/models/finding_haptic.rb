class FindingHaptic < ActiveRecord::Base
  belongs_to :finding
  belongs_to :haptic_fidelity
  # attr_accessible :title, :body
end
