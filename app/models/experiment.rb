class Experiment < ActiveRecord::Base
  belongs_to :paper
  has_many :tasks, :dependent => :destroy

  belongs_to :gender

  has_many :experiment_displays
  has_many :displays, :through => :experiment_displays

  has_many :experiment_hardwares
  has_many :hardwares, :through => :experiment_hardwares

  has_many :experiment_softwares
  has_many :softwares, :through => :experiment_softwares

  has_many :experiment_components
  has_many :components, :through => :experiment_components

  accepts_nested_attributes_for :tasks
  attr_accessible :comp_desc, :constants, :exp_desc, :other_vars, :part_age_max, :part_age_min, 
    :part_background, :part_num, :system_desc, :tasks, :title, :gender_id
end
