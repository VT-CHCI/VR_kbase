class CreateScales < ActiveRecord::Migration
  def change
    create_table :scales do |t|
      t.string :level

      t.timestamps
    end
  end
end
