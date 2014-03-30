class ExperimentIndyVariable < ActiveRecord::Base
  belongs_to :indy_variable
  belongs_to :experiment
  
  accepts_nested_attributes_for :indy_variable

  attr_accessible :desc, :indy_variable_attributes, :indy_variable_tokens

  validates :desc, presence: true, if: "!indy_variable_tokens.nil?"

  attr_reader :indy_variable_tokens

  def indy_variable_tokens=(id)
    id.gsub!(/CREATE_(.+?)_END/) do
      IndyVariable.create!(:variable => $1).id
    end
    self.indy_variable_id = id
  end
end
