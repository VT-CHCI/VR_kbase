class AddValidatedToMetrics < ActiveRecord::Migration
  def change
    add_column :metrics, :validated, :boolean, :null => false, :default => false
  end
end
