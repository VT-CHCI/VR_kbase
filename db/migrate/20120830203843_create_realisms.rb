class CreateRealisms < ActiveRecord::Migration
  def change
    create_table :realisms do |t|
      t.string :level

      t.timestamps
    end
  end
end
