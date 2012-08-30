class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :task_category

      t.timestamps
    end
  end
end
