class AddTooltipToSystemAppropriatenesses < ActiveRecord::Migration
  def change
    add_column :system_appropriatenesses, :tooltip, :string
  end
end
