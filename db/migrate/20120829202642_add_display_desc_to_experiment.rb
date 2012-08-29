class AddDisplayDescToExperiment < ActiveRecord::Migration
  def change
    change_table :experiments do |t|
       t.text :display_desc
    end
  end
end
