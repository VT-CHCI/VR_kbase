class AddValidatedToAuralFidelities < ActiveRecord::Migration
  def change
    add_column :aural_fidelities, :validated, :boolean, :null => false, :default => false
  end
end
