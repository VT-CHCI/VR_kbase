class CreateAuthorPapers < ActiveRecord::Migration
  def change
    create_table :author_papers do |t|
      t.belongs_to :author
      t.belongs_to :paper

      t.timestamps
    end
    add_index :author_papers, :author_id
    add_index :author_papers, :paper_id
  end
end
