class AddValidatedToIndyVariables < ActiveRecord::Migration
  def change
    add_column :indy_variables, :validated, :boolean, :null => false, :default => false
  end
end
