class RemoveComponents < ActiveRecord::Migration
  def up
    drop_table :components if ActiveRecord::Base.connection.table_exists? 'components'
    drop_table :experiment_components if ActiveRecord::Base.connection.table_exists? 'experiment_components'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
