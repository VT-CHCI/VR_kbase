class CreateExperimentSoftwares < ActiveRecord::Migration
  def change
    create_table :experiment_softwares do |t|
      t.belongs_to :software
      t.belongs_to :experiment

      t.timestamps
    end
    add_index :experiment_softwares, :software_id
    add_index :experiment_softwares, :experiment_id
  end
end
