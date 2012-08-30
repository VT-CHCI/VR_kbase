class CreateFindingSpecificities < ActiveRecord::Migration
  def change
    create_table :finding_specificities do |t|
      t.belongs_to :specificity
      t.belongs_to :finding

      t.timestamps
    end
    add_index :finding_specificities, :specificity_id
    add_index :finding_specificities, :finding_id
  end
end
