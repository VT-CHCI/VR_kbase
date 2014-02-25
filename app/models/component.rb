class Component < ActiveRecord::Base
  has_many :experiment_components
  has_many :experiments, :through => :experiment_components

  has_one :finding

  attr_accessible :comp_of_immersion
end
