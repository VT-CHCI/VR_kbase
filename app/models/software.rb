class Software < ActiveRecord::Base
  has_many :experiment_softwares
  has_many :experiments, :through => :experiment_softwares

  attr_accessible :software
end
