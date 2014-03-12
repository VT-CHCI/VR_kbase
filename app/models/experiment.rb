class Experiment < ActiveRecord::Base
  belongs_to :paper
  has_many :tasks, :dependent => :destroy

  belongs_to :gender

  accepts_nested_attributes_for :tasks, :allow_destroy => true

  # validates_presence_of :title

  attr_accessible :comp_desc, :constants, :exp_desc, :other_vars, :part_age_max, :part_age_min,
    :part_background, :part_num, :display_desc, :system_desc, :tasks, :title, :gender_id,
    :hardware_tokens, :software_tokens, :component_tokens, :tasks_attributes, :findings_attributes, 
    :component_ids, :category_ids, :experiment_displays_attributes


  has_many :experiment_displays, :dependent => :destroy
  has_many :displays, :through => :experiment_displays

  accepts_nested_attributes_for :experiment_displays



  has_many :experiment_hardwares, :dependent => :destroy
  has_many :hardwares, :through => :experiment_hardwares

  attr_reader :hardware_tokens

  def hardware_tokens=(ids)
    ids.gsub!(/CREATE_(.+?)_END/) do
      Hardware.create!(:hardware => $1).id
    end
    self.hardware_ids = ids.split(",")
  end

  has_many :experiment_softwares, :dependent => :destroy
  has_many :softwares, :through => :experiment_softwares

  attr_reader :software_tokens

  def software_tokens=(ids)
    ids.gsub!(/CREATE_(.+?)_END/) do
      Software.create!(:software => $1).id
    end
    self.software_ids = ids.split(",")
  end

  has_many :experiment_components, :dependent => :destroy
  has_many :components, :through => :experiment_components

  attr_reader :component_tokens

  def component_tokens=(ids)
    ids.gsub!(/CREATE_(.+?)_END/) do
      Component.create!(:comp_of_immersion => $1).id
    end
    self.component_ids = ids.split(",")
  end
end
