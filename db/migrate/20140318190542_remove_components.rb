class RemoveComponents < ActiveRecord::Migration
  def up
    drop_table :components
    drop_table :experiment_components
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
