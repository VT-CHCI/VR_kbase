class AddDescToExperimentDisplay < ActiveRecord::Migration
  def change
    add_column :experiment_displays, :desc, :string
  end
end
