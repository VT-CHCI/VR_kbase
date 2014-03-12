class CreateExperimentSystemApps < ActiveRecord::Migration
  def change
    create_table :experiment_system_apps do |t|
      t.belongs_to :experiment
      t.belongs_to :system_appropriateness
      t.string :desc

      t.timestamps
    end
    add_index :experiment_system_apps, :experiment_id
    add_index :experiment_system_apps, :system_appropriateness_id
  end
end
