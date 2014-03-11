class CreateVisualFidelities < ActiveRecord::Migration
  def change
    create_table :visual_fidelities do |t|
      t.string :component

      t.timestamps
    end
  end
end
