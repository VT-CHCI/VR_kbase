class AddValidatedToVisualFidelities < ActiveRecord::Migration
  def change
    add_column :visual_fidelities, :validated, :boolean, :null => false, :default => false
  end
end
