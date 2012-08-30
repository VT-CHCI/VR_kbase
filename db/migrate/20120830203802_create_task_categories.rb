class CreateTaskCategories < ActiveRecord::Migration
  def change
    create_table :task_categories do |t|
      t.belongs_to :category
      t.belongs_to :task

      t.timestamps
    end
    add_index :task_categories, :category_id
    add_index :task_categories, :task_id
  end
end
