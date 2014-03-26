class AddTooltipToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :tooltip, :string
  end
end
