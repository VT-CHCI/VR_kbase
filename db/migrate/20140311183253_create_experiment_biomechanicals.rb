class CreateExperimentBiomechanicals < ActiveRecord::Migration
  def change
    create_table :experiment_biomechanicals do |t|
      t.belongs_to :experiment
      t.belongs_to :biomechanical_symmetry
      t.string :desc

      t.timestamps
    end
    add_index :experiment_biomechanicals, :experiment_id
    add_index :experiment_biomechanicals, :biomechanical_symmetry_id
  end
end
