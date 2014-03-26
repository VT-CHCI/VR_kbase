class AddDescToTaskMetrics < ActiveRecord::Migration
  def change
    add_column :task_metrics, :desc, :string
  end
end
