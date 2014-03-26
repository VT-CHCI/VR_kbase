class AddTooltipToHapticFidelities < ActiveRecord::Migration
  def change
    add_column :haptic_fidelities, :tooltip, :string
  end
end
