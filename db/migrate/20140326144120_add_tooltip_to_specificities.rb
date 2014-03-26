class AddTooltipToSpecificities < ActiveRecord::Migration
  def change
    add_column :specificities, :tooltip, :string
  end
end
