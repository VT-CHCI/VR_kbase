class Paper < ActiveRecord::Base
  has_many :author_papers, :dependent => :destroy
  has_many :authors, :through => :author_papers
  has_many :experiments, :dependent => :destroy
  has_many :paper_venues, :dependent => :destroy
  has_many :venues, :through => :paper_venues, :autosave => true

  accepts_nested_attributes_for :author_papers, :allow_destroy => true
  accepts_nested_attributes_for :experiments, :allow_destroy => true
  accepts_nested_attributes_for :venues

  attr_accessible :doi, :end_page, :num_views, :paper_url, :start_page, :title, :volume,
    :year, :issue, :venues_attributes, :experiments_attributes, :author_papers_attributes, 
    :tasks_attributes, :findings_attributes, :category_ids

  # If you need to validate the associated record, you can add a method like this:
  #     validate_associated_record_for_venue
  def autosave_associated_records_for_venues
    existing_venues = []
    new_venues = []
    # Find or create the venue by name, should always end up with one existing or one new
    venues.each do |venue|
      if existing_venue = Venue.find_by_name(venue.name)
        existing_venues << existing_venue
        self.venues = existing_venues
      else
        tmp = Venue.new
        tmp.name = venue.name
        tmp.accronym = venue.accronym
        new_venues << tmp
        self.venues = new_venues
        self.paper_venues[0].venue_id = self.venues[0].id # we can do this since we know we only have one venue
      end
    end
    # append two lists to use one new venue or one existing venue
    #self.venues = new_venues + existing_venues
  end
end