class AddPublishedToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :published, :boolean, :null => false, :default => false
  end
end
