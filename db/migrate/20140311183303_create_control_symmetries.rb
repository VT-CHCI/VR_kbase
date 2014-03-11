class CreateControlSymmetries < ActiveRecord::Migration
  def change
    create_table :control_symmetries do |t|
      t.string :component

      t.timestamps
    end
  end
end
