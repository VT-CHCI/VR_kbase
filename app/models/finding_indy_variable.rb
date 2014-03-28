class FindingIndyVariable < ActiveRecord::Base
  belongs_to :finding
  belongs_to :indy_variable
  # attr_accessible :title, :body
end
