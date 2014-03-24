class AddValidatedToSoftwares < ActiveRecord::Migration
  def change
    add_column :softwares, :validated, :boolean, :null => false, :default => false
  end
end
