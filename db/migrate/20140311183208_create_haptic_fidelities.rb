class CreateHapticFidelities < ActiveRecord::Migration
  def change
    create_table :haptic_fidelities do |t|
      t.string :component

      t.timestamps
    end
  end
end
