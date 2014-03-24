class AddValidatedToControlSymmetries < ActiveRecord::Migration
  def change
    add_column :control_symmetries, :validated, :boolean, :null => false, :default => false
  end
end
