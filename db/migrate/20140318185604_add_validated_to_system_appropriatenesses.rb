class AddValidatedToSystemAppropriatenesses < ActiveRecord::Migration
  def change
    add_column :system_appropriatenesses, :validated, :boolean, :null => false, :default => false
  end
end
