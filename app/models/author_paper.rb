class AuthorPaper < ActiveRecord::Base
  belongs_to :author
  belongs_to :paper
  # attr_accessible :title, :body
end
