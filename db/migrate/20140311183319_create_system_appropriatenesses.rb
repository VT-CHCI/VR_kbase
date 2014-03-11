class CreateSystemAppropriatenesses < ActiveRecord::Migration
  def change
    create_table :system_appropriatenesses do |t|
      t.string :component

      t.timestamps
    end
  end
end
