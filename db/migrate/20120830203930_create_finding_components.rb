class CreateFindingComponents < ActiveRecord::Migration
  def change
    create_table :finding_components do |t|
      t.belongs_to :finding
      t.belongs_to :component

      t.timestamps
    end
    add_index :finding_components, :finding_id
    add_index :finding_components, :component_id
  end
end
