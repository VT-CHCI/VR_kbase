class AddVenueToPaper < ActiveRecord::Migration
  def self.up
    change_table(:venues) do |t|
      t.belongs_to :paper
    end
  end
  def self.down 
    remove_column :paper
  end
end
