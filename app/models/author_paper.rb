class AuthorPaper < ActiveRecord::Base
  belongs_to :author, :autosave => true
  belongs_to :paper
  
  accepts_nested_attributes_for :author

  attr_accessible :order, :author_attributes

  # If you need to validate the associated record, you can add a method like this:
  #     validate_associated_record_for_author
  def autosave_associated_records_for_author
    # Find or create the author by name
    if existing_author = Author.where(:last_name => author.last_name, :first_name => author.first_name, :middle_initial => author.middle_initial).first
      self.author = existing_author
    else
      self.author = author
    end
  end
end
