class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :title
      t.date :year
      t.integer :volume
      t.integer :num_pages
      t.integer :start_page
      t.string :doi
      t.string :paper_url
      t.integer :num_views

      t.timestamps
    end
  end
end
