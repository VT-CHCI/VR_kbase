class CreateExperimentDisplays < ActiveRecord::Migration
  def change
    create_table :experiment_displays do |t|
      t.belongs_to :display
      t.belongs_to :experiment

      t.timestamps
    end
    add_index :experiment_displays, :display_id
    add_index :experiment_displays, :experiment_id
  end
end
