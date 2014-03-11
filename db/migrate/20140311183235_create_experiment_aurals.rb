class CreateExperimentAurals < ActiveRecord::Migration
  def change
    create_table :experiment_aurals do |t|
      t.belongs_to :experiment
      t.belongs_to :aural_fidelity
      t.string :desc

      t.timestamps
    end
    add_index :experiment_aurals, :experiment_id
    add_index :experiment_aurals, :aural_fidelity_id
  end
end
