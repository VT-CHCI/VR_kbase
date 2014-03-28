class CreateFindingCategories < ActiveRecord::Migration
  def change
    create_table :finding_categories do |t|
      t.belongs_to :finding
      t.belongs_to :category

      t.timestamps
    end
    add_index :finding_categories, :finding_id
    add_index :finding_categories, :category_id
  end
end
