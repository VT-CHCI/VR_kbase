class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.string :metric

      t.timestamps
    end
  end
end
