class AddTooltipToDensities < ActiveRecord::Migration
  def change
    add_column :densities, :tooltip, :string
  end
end
