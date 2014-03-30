class ExperimentHardware < ActiveRecord::Base
  belongs_to :hardware
  belongs_to :experiment
  
  accepts_nested_attributes_for :hardware

  attr_accessible :desc, :hardware_attributes, :hardware_tokens

  validates :desc, presence: true, if: "!hardware_tokens.nil?"

  attr_reader :hardware_tokens

  def hardware_tokens=(id)
    id.gsub!(/CREATE_(.+?)_END/) do
      Hardware.create!(:hardware => $1).id
    end
    self.hardware_id = id
  end
end
