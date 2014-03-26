class CreateExperimentIndyVariables < ActiveRecord::Migration
  def change
    create_table :experiment_indy_variables do |t|
      t.belongs_to :experiment
      t.belongs_to :indy_variable
      t.string :desc

      t.timestamps
    end
    add_index :experiment_indy_variables, :experiment_id
    add_index :experiment_indy_variables, :indy_variable_id
  end
end
