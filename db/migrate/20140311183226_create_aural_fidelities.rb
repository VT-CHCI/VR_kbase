class CreateAuralFidelities < ActiveRecord::Migration
  def change
    create_table :aural_fidelities do |t|
      t.string :component

      t.timestamps
    end
  end
end
