class CreateHardwares < ActiveRecord::Migration
  def change
    create_table :hardwares do |t|
      t.string :hardware
      t.string :string

      t.timestamps
    end
  end
end
