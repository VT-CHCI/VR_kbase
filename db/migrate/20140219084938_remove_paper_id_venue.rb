class RemovePaperIdVenue < ActiveRecord::Migration
  def change
  	change_table :venues do |t|
	  t.remove :paper_id
	end
  end
end
