class CreateExperimentHardwares < ActiveRecord::Migration
  def change
    create_table :experiment_hardwares do |t|
      t.belongs_to :hardware
      t.belongs_to :experiment

      t.timestamps
    end
    add_index :experiment_hardwares, :hardware_id
    add_index :experiment_hardwares, :experiment_id
  end
end
