class AddTooltipToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :tooltip, :string
  end
end
