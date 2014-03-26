class AddTooltipToDimensions < ActiveRecord::Migration
  def change
    add_column :dimensions, :tooltip, :string
  end
end
