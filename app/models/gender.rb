class Gender < ActiveRecord::Base  
  attr_accessible :gender
  has_one :experiment
end
