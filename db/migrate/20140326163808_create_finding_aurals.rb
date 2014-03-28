class CreateFindingAurals < ActiveRecord::Migration
  def change
    create_table :finding_aurals do |t|
      t.belongs_to :finding
      t.belongs_to :aural_fidelity

      t.timestamps
    end
    add_index :finding_aurals, :finding_id
    add_index :finding_aurals, :aural_fidelity_id
  end
end
