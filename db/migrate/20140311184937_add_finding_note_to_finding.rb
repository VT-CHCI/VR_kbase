class AddFindingNoteToFinding < ActiveRecord::Migration
  def change
    add_column :findings, :finding_note, :string
  end
end
