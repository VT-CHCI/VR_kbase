class RemoveCategoryIdFromFinding < ActiveRecord::Migration
  def up
    remove_column :findings, :category_id
  end

  def down
    add_column :findings, :category_id, :integer
  end
end
