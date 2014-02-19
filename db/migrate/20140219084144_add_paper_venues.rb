class AddPaperVenues < ActiveRecord::Migration
  def change
    drop_table :paper_venues

  	create_table :paper_venues do |t|
      t.belongs_to :venue
      t.belongs_to :paper

      t.timestamps
	end

    add_index :paper_venues, :venue_id
    add_index :paper_venues, :paper_id
  end
end
