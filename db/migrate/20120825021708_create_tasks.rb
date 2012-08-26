class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :experiment
      t.string :title
      t.text :task_desc
      t.text :interface_desc
      t.text :env_desc

      t.timestamps
    end
    add_index :tasks, :experiment_id
  end
end
