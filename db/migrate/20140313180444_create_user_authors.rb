class CreateUserAuthors < ActiveRecord::Migration
  def change
    create_table :user_authors do |t|
      t.belongs_to :user
      t.belongs_to :author

      t.timestamps
    end
    add_index :user_authors, :user_id
    add_index :user_authors, :author_id
  end
end
