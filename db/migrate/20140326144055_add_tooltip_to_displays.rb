class AddTooltipToDisplays < ActiveRecord::Migration
  def change
    add_column :displays, :tooltip, :string
  end
end
