class AddDescToExperimentHardware < ActiveRecord::Migration
  def change
    add_column :experiment_hardwares, :desc, :string
  end
end
