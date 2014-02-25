class AddAuthorOrder < ActiveRecord::Migration
  def change
  	change_table :author_papers do |t|
	  t.integer :order
	end
  end
end
