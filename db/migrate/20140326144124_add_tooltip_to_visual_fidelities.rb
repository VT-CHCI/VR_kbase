class AddTooltipToVisualFidelities < ActiveRecord::Migration
  def change
    add_column :visual_fidelities, :tooltip, :string
  end
end
