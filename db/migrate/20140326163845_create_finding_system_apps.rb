class CreateFindingSystemApps < ActiveRecord::Migration
  def change
    create_table :finding_system_apps do |t|
      t.belongs_to :finding
      t.belongs_to :system_appropriateness

      t.timestamps
    end
    add_index :finding_system_apps, :finding_id
    add_index :finding_system_apps, :system_appropriateness_id
  end
end
