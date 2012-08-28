class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :comp_of_immersion

      t.timestamps
    end
  end
end
