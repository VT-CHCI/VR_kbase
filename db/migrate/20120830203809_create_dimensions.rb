class CreateDimensions < ActiveRecord::Migration
  def change
    create_table :dimensions do |t|
      t.string :level

      t.timestamps
    end
  end
end
