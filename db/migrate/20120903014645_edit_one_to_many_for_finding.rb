class EditOneToManyForFinding < ActiveRecord::Migration
  def change
    drop_table :finding_relationships
    drop_table :finding_specificities

    change_table :findings do |t|
      t.belongs_to :relationship
      t.belongs_to :specificity
    end
  end
end
