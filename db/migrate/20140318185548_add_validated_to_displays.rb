class AddValidatedToDisplays < ActiveRecord::Migration
  def change
    add_column :displays, :validated, :boolean, :null => false, :default => false
  end
end
