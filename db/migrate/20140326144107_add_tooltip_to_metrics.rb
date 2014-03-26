class AddTooltipToMetrics < ActiveRecord::Migration
  def change
    add_column :metrics, :tooltip, :string
  end
end
