class CreateBiomechanicalSymmetries < ActiveRecord::Migration
  def change
    create_table :biomechanical_symmetries do |t|
      t.string :component

      t.timestamps
    end
  end
end
