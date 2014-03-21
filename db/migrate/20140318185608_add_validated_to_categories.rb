class AddValidatedToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :validated, :boolean, :null => false, :default => false
  end
end
