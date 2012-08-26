class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.belongs_to :paper
      t.string :title
      t.text :exp_desc
      t.integer :part_num
      t.integer :part_age_min
      t.integer :part_age_max
      t.text :part_background
      t.text :system_desc
      t.text :other_vars
      t.text :constants
      t.text :comp_desc

      t.timestamps
    end
    add_index :experiments, :paper_id
  end
end
