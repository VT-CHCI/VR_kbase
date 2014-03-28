class CreateFindingIndyVariables < ActiveRecord::Migration
  def change
    create_table :finding_indy_variables do |t|
      t.belongs_to :finding
      t.belongs_to :indy_variable

      t.timestamps
    end
    add_index :finding_indy_variables, :finding_id
    add_index :finding_indy_variables, :indy_variable_id
  end
end
