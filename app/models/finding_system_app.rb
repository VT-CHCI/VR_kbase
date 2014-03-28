class FindingSystemApp < ActiveRecord::Base
  belongs_to :finding
  belongs_to :system_appropriateness
  # attr_accessible :title, :body
end
