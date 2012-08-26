class Experiment < ActiveRecord::Base
  belongs_to :paper
  has_many :tasks, :dependent => :destroy
  accepts_nested_attributes_for :tasks
  attr_accessible :comp_desc, :constants, :exp_desc, :other_vars, :part_age_max, :part_age_min, :part_background, :part_num, :system_desc, :tasks, :title
end
