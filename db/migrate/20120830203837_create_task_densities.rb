class CreateTaskDensities < ActiveRecord::Migration
  def change
    create_table :task_densities do |t|
      t.belongs_to :density
      t.belongs_to :task

      t.timestamps
    end
    add_index :task_densities, :density_id
    add_index :task_densities, :task_id
  end
end
