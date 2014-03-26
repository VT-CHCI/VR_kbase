class AddTooltipToIndyVariables < ActiveRecord::Migration
  def change
    add_column :indy_variables, :tooltip, :string
  end
end
