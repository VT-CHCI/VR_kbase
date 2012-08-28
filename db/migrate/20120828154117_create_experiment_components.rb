class CreateExperimentComponents < ActiveRecord::Migration
  def change
    create_table :experiment_components do |t|
      t.belongs_to :component
      t.belongs_to :experiment

      t.timestamps
    end
    add_index :experiment_components, :component_id
    add_index :experiment_components, :experiment_id
  end
end
