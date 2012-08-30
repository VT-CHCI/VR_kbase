class CreateFindingRelationships < ActiveRecord::Migration
  def change
    create_table :finding_relationships do |t|
      t.belongs_to :relationship
      t.belongs_to :finding

      t.timestamps
    end
    add_index :finding_relationships, :relationship_id
    add_index :finding_relationships, :finding_id
  end
end
