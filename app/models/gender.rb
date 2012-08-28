class Gender < ActiveRecord::Base
  has_many :experiment_genders
  has_many :experiments, :through => :experiment_genders
  
  attr_accessible :gender
end
