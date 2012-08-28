class AddGenderToExperiment < ActiveRecord::Migration
  def change
    change_table :experiments do |t|
      t.belongs_to :gender
    end

    drop_table :experiment_genders
  end
end
