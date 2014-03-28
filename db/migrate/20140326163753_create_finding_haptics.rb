class CreateFindingHaptics < ActiveRecord::Migration
  def change
    create_table :finding_haptics do |t|
      t.belongs_to :finding
      t.belongs_to :haptic_fidelity

      t.timestamps
    end
    add_index :finding_haptics, :finding_id
    add_index :finding_haptics, :haptic_fidelity_id
  end
end
