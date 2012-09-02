class EditOneToManyForTask < ActiveRecord::Migration
  def change
    drop_table :task_dimensions
    drop_table :task_scales
    drop_table :task_densities
    drop_table :task_realisms

    change_table :tasks do |t|
      t.belongs_to :dimension
      t.belongs_to :scale
      t.belongs_to :density
      t.belongs_to :realism
    end
  end
end
