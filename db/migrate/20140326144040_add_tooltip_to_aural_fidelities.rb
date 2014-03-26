class AddTooltipToAuralFidelities < ActiveRecord::Migration
  def change
    add_column :aural_fidelities, :tooltip, :string
  end
end
