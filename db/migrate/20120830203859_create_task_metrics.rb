class CreateTaskMetrics < ActiveRecord::Migration
  def change
    create_table :task_metrics do |t|
      t.belongs_to :metric
      t.belongs_to :task

      t.timestamps
    end
    add_index :task_metrics, :metric_id
    add_index :task_metrics, :task_id
  end
end
