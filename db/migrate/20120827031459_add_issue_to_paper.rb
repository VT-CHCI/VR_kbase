class AddIssueToPaper < ActiveRecord::Migration
  def change
    change_table(:papers) do |t|
      t.integer :issue
    end
  end
end
