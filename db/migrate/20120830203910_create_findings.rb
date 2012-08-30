class CreateFindings < ActiveRecord::Migration
  def change
    create_table :findings do |t|
      t.belongs_to :task
      t.belongs_to :metric
      t.belongs_to :category
      t.string :title
      t.string :summary
      t.text :issue

      t.timestamps
    end
    add_index :findings, :task_id
    add_index :findings, :metric_id
    add_index :findings, :category_id
  end
end
