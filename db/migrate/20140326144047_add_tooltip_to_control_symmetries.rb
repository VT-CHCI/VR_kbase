class AddTooltipToControlSymmetries < ActiveRecord::Migration
  def change
    add_column :control_symmetries, :tooltip, :string
  end
end
