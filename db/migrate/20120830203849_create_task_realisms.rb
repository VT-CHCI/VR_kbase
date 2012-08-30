class CreateTaskRealisms < ActiveRecord::Migration
  def change
    create_table :task_realisms do |t|
      t.belongs_to :realism
      t.belongs_to :task

      t.timestamps
    end
    add_index :task_realisms, :realism_id
    add_index :task_realisms, :task_id
  end
end
