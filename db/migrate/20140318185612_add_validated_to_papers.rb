class AddValidatedToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :validated, :boolean, :null => false, :default => false
  end
end
