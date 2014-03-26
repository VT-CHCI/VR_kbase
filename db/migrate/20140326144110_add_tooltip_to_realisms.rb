class AddTooltipToRealisms < ActiveRecord::Migration
  def change
    add_column :realisms, :tooltip, :string
  end
end
