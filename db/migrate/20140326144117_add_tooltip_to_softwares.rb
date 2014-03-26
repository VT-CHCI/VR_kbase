class AddTooltipToSoftwares < ActiveRecord::Migration
  def change
    add_column :softwares, :tooltip, :string
  end
end
