class AddTooltipToScales < ActiveRecord::Migration
  def change
    add_column :scales, :tooltip, :string
  end
end
