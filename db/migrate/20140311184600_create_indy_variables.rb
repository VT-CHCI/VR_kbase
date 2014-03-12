class CreateIndyVariables < ActiveRecord::Migration
  def change
    create_table :indy_variables do |t|
      t.string :variable

      t.timestamps
    end
  end
end
