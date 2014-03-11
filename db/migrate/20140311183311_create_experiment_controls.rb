class CreateExperimentControls < ActiveRecord::Migration
  def change
    create_table :experiment_controls do |t|
      t.belongs_to :experiment
      t.belongs_to :control_symmetry
      t.string :desc

      t.timestamps
    end
    add_index :experiment_controls, :experiment_id
    add_index :experiment_controls, :control_symmetry_id
  end
end
