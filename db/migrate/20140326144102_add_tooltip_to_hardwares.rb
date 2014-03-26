class AddTooltipToHardwares < ActiveRecord::Migration
  def change
    add_column :hardwares, :tooltip, :string
  end
end
