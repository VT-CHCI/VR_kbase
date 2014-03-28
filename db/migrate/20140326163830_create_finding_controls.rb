class CreateFindingControls < ActiveRecord::Migration
  def change
    create_table :finding_controls do |t|
      t.belongs_to :finding
      t.belongs_to :control_symmetry

      t.timestamps
    end
    add_index :finding_controls, :finding_id
    add_index :finding_controls, :control_symmetry_id
  end
end
