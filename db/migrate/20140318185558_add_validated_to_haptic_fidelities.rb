class AddValidatedToHapticFidelities < ActiveRecord::Migration
  def change
    add_column :haptic_fidelities, :validated, :boolean, :null => false, :default => false
  end
end
