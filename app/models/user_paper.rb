class UserPaper < ActiveRecord::Base
  belongs_to :user
  belongs_to :paper
  # attr_accessible :title, :body

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :paper
end
