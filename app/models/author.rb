class Author < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :middle_initial
end
