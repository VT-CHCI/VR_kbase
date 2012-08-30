class CreateTaskScales < ActiveRecord::Migration
  def change
    create_table :task_scales do |t|
      t.belongs_to :scale
      t.belongs_to :task

      t.timestamps
    end
    add_index :task_scales, :scale_id
    add_index :task_scales, :task_id
  end
end
