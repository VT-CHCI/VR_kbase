class CreateFindingVisuals < ActiveRecord::Migration
  def change
    create_table :finding_visuals do |t|
      t.belongs_to :finding
      t.belongs_to :visual_fidelity

      t.timestamps
    end
    add_index :finding_visuals, :finding_id
    add_index :finding_visuals, :visual_fidelity_id
  end
end
