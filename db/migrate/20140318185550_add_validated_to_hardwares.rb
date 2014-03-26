class AddValidatedToHardwares < ActiveRecord::Migration
  def change
    add_column :hardwares, :validated, :boolean, :null => false, :default => false
  end
end
