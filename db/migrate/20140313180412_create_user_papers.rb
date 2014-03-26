class CreateUserPapers < ActiveRecord::Migration
  def change
    create_table :user_papers do |t|
      t.belongs_to :user
      t.belongs_to :paper

      t.timestamps
    end
    add_index :user_papers, :user_id
    add_index :user_papers, :paper_id
  end
end
