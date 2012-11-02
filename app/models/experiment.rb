class Experiment < ActiveRecord::Base
  belongs_to :paper
  has_many :tasks, :dependent => :destroy

  belongs_to :gender

  has_many :experiment_displays
  has_many :displays, :through => :experiment_displays

  accepts_nested_attributes_for :tasks
  
  # validates_presence_of :title
  
  attr_accessible :comp_desc, :constants, :exp_desc, :other_vars, :part_age_max, :part_age_min, 
    :part_background, :part_num, :display_desc, :system_desc, :tasks, :title, :gender_id, :display_tokens,
    :hardware_tokens, :software_tokens, :component_tokens, :tasks_attributes, :findings_attributes, :component_ids

  attr_reader :display_tokens

  def display_tokens=(ids)
    ids.gsub!(/CREATE_(.+?)_END/) do
      Display.create!(:display => $1).id
    end
    self.display_ids = ids.split(",")
  end

  has_many :experiment_hardwares
  has_many :hardwares, :through => :experiment_hardwares

  attr_reader :hardware_tokens

  def hardware_tokens=(ids)
    ids.gsub!(/CREATE_(.+?)_END/) do
      Hardware.create!(:hardware => $1).id
    end
    self.hardware_ids = ids.split(",")
  end

  has_many :experiment_softwares
  has_many :softwares, :through => :experiment_softwares

  attr_reader :software_tokens

  def software_tokens=(ids)
    ids.gsub!(/CREATE_(.+?)_END/) do
      Software.create!(:software => $1).id
    end
    self.software_ids = ids.split(",")
  end

  has_many :experiment_components
  has_many :components, :through => :experiment_components

  attr_reader :component_tokens

  def component_tokens=(ids)
    ids.gsub!(/CREATE_(.+?)_END/) do
      Component.create!(:comp_of_immersion => $1).id
    end
    self.component_ids = ids.split(",")
  end
end
