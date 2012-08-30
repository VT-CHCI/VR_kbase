class CreateDensities < ActiveRecord::Migration
  def change
    create_table :densities do |t|
      t.string :level

      t.timestamps
    end
  end
end
