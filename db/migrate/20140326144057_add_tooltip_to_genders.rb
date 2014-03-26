class AddTooltipToGenders < ActiveRecord::Migration
  def change
    add_column :genders, :tooltip, :string
  end
end
