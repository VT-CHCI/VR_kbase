class CreateAuthorsPapers < ActiveRecord::Migration
  def up
  	create_table :authors_papers do |t|
      t.belongs_to :author
      t.belongs_to :paper

      t.timestamps
  end

  def down
  end
end
