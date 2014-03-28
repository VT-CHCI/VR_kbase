class CreateFindingBiomechanicals < ActiveRecord::Migration
  def change
    create_table :finding_biomechanicals do |t|
      t.belongs_to :finding
      t.belongs_to :biomechanical_symmetry

      t.timestamps
    end
    add_index :finding_biomechanicals, :finding_id
    add_index :finding_biomechanicals, :biomechanical_symmetry_id
  end
end
