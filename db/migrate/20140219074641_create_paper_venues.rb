class CreatePaperVenues < ActiveRecord::Migration
  def change
    create_table :paper_venues do |t|

      t.timestamps
    end
  end
end
