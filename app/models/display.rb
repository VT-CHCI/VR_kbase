class Display < ActiveRecord::Base
  has_many :experiment_displays
  has_many :experiments, :through => :experiment_displays

  attr_accessible :display
end
