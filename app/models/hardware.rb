class Hardware < ActiveRecord::Base
  has_many :experiment_hardwares
  has_many :experiments, :through => :experiment_hardwares

  attr_accessible :hardware, :string
end
