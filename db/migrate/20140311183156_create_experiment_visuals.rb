class CreateExperimentVisuals < ActiveRecord::Migration
  def change
    create_table :experiment_visuals do |t|
      t.belongs_to :experiment
      t.belongs_to :visual_fidelity
      t.string :desc

      t.timestamps
    end
    add_index :experiment_visuals, :experiment_id
    add_index :experiment_visuals, :visual_fidelity_id
  end
end
