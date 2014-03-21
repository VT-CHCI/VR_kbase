class AddValidatedToBiomechanicalSymmetries < ActiveRecord::Migration
  def change
    add_column :biomechanical_symmetries, :validated, :boolean, :null => false, :default => false
  end
end
