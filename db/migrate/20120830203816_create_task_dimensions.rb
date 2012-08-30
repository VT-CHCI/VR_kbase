class CreateTaskDimensions < ActiveRecord::Migration
  def change
    create_table :task_dimensions do |t|
      t.belongs_to :dimension
      t.belongs_to :task

      t.timestamps
    end
    add_index :task_dimensions, :dimension_id
    add_index :task_dimensions, :task_id
  end
end
