class CreateSpecificities < ActiveRecord::Migration
  def change
    create_table :specificities do |t|
      t.string :level

      t.timestamps
    end
  end
end
