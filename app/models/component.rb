class Component < ActiveRecord::Base
  has_many :experiment_components
  has_many :experiments, :through => :experiment_components

  attr_accessible :comp_of_immersion
end
