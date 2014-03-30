class ExperimentDisplay < ActiveRecord::Base
  belongs_to :display
  belongs_to :experiment

  accepts_nested_attributes_for :display

  attr_accessible :desc, :display_attributes, :display_tokens, :display_id

  validates :desc, :presence => true

  attr_reader :display_tokens

  def display_tokens=(id)
    id.gsub!(/CREATE_(.+?)_END/) do
      Display.create!(:display => $1).id
    end
    self.display_id = id
  end
end
