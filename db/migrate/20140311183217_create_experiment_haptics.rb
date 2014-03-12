class CreateExperimentHaptics < ActiveRecord::Migration
  def change
    create_table :experiment_haptics do |t|
      t.belongs_to :experiment
      t.belongs_to :haptic_fidelity
      t.string :desc

      t.timestamps
    end
    add_index :experiment_haptics, :experiment_id
    add_index :experiment_haptics, :haptic_fidelity_id
  end
end
