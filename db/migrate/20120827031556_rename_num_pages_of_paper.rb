class RenameNumPagesOfPaper < ActiveRecord::Migration
  def change
    rename_column :papers, :num_pages, :end_page
  end
end
