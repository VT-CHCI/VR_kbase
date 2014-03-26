class AddTooltipToBiomechanicalSymmetries < ActiveRecord::Migration
  def change
    add_column :biomechanical_symmetries, :tooltip, :string
  end
end
