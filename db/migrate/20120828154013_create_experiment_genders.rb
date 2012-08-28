class CreateExperimentGenders < ActiveRecord::Migration
  def change
    create_table :experiment_genders do |t|
      t.belongs_to :gender
      t.belongs_to :experiment

      t.timestamps
    end
    add_index :experiment_genders, :gender_id
    add_index :experiment_genders, :experiment_id
  end
end
